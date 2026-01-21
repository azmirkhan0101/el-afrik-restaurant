import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MapRouteController extends GetxController {
  final String apiKey = dotenv.get('GOOGLE_MAPS_API_KEY');
  final Dio _dio = Dio();

  static const LatLng startLocation = LatLng(40.7128, -74.0060);
  static const LatLng endLocation = LatLng(39.9526, -75.1652);

  GoogleMapController? mapController;

  RxSet<Marker> markers = <Marker>{}.obs;
  RxSet<Polyline> polylines = <Polyline>{}.obs;
  Rxn<String> distance = Rxn<String>();
  Rxn<String> duration = Rxn<String>();
  Rx<RxStatus> status = Rx<RxStatus>(RxStatus.loading());
  Rx<TravelMode> currentTravelMode = TravelMode.driving.obs;

  late Marker riderMarker;

  @override
  void onInit() {
    super.onInit();
    loadBikeMarker();
    _fetchData();
  }


  //##########################################################
  Timer? _timer;
  int _currentPathIndex = 0;
  List<LatLng> _routeCoordinates = [];

  // Call this after polylines are fetched
  void startSimulation() {
    _timer?.cancel(); // Clear existing timer
    _currentPathIndex = 0;

    if (_routeCoordinates.isEmpty) return;

    _currentPathIndex = _routeCoordinates.length -1;

    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPathIndex > 0) {
        _currentPathIndex--;
        print("Current index: ${_currentPathIndex}");
        print("LatLng: ${_routeCoordinates[_currentPathIndex]}");
        _updateRiderPosition(_routeCoordinates[_currentPathIndex]);
      } else {
        timer.cancel(); // Arrived at destination
      }
    });
  }

  void _updateRiderPosition(LatLng newPos) {
    // 1. Calculate new bearing for the icon rotation
    double bearing = getBearing(
        _routeCoordinates[_currentPathIndex - 1],
        newPos
    );

    // 2. Update the marker in the set
    markers.removeWhere((m) => m.markerId.value == 'end');

    markers.add(
      Marker(
        markerId: const MarkerId('end'),
        position: newPos,
        icon: bikeMarkerIcon,
        rotation: bearing + 90, // Adjust based on your asset orientation
        flat: true,
        anchor: const Offset(0.5, 0.5),
      ),
    );

    // 3. Optional: Move camera to follow the rider
    mapController?.animateCamera(CameraUpdate.newLatLng(newPos));
  }
  //##########################################################

  late BitmapDescriptor bikeMarkerIcon;

  Future<void> loadBikeMarker() async {
    bikeMarkerIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(96, 96)),
      'assets/images/rider_car.png',
    );
    riderMarker = Marker(
      markerId: const MarkerId('end'),
      position: endLocation,
      icon: bikeMarkerIcon,
      rotation: getBearing( startLocation, endLocation ) + 90,
      flat: true,
      anchor: const Offset(0.5, 0.5), //center align
    );

    markers.add(riderMarker);
    _addInitialMarkers();
  }

  double getBearing(LatLng start, LatLng end) {
    final lat1 = start.latitude * pi / 180;
    final lat2 = end.latitude * pi / 180;
    final dLon = (end.longitude - start.longitude) * pi / 180;

    final y = sin(dLon) * cos(lat2);
    final x = cos(lat1) * sin(lat2) -
        sin(lat1) * cos(lat2) * cos(dLon);

    return (atan2(y, x) * 180 / pi + 360) % 360;
  }

  // add start and end markers
  void _addInitialMarkers() {
    markers.add(
      const Marker(markerId: MarkerId('start'), position: startLocation),
    );
    //markers.add(const Marker(markerId: MarkerId('end'), position: endLocation));
  }

  // update selected travel mode
  void updateTravelMode(TravelMode mode) {
    currentTravelMode.value = mode;
    status.value = RxStatus.loading();
    polylines.clear();
    _fetchData();
  }

  // fetch both visual route, time & distance
  void _fetchData() async {
    await Future.wait([fetchRoutePolylines(), fetchTravelStats()]);
  }

  // callback when map ready
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (polylines.isNotEmpty) {
      fitBounds();
    }
  }

  // adjusts camera zoom to ensure start and end points visible
  void fitBounds() {
    if (mapController == null) return;

    LatLngBounds bounds;
    if (startLocation.latitude > endLocation.latitude) {
      bounds = LatLngBounds(southwest: endLocation, northeast: startLocation);
    } else {
      bounds = LatLngBounds(southwest: startLocation, northeast: endLocation);
    }

    mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 70));
  }

  // fetch distance & duration
  Future<void> fetchTravelStats() async {
    String modeStr = currentTravelMode.value.toString().split('.').last;

    final String url =
        "https://maps.googleapis.com/maps/api/distancematrix/json"
        "?origins=${startLocation.latitude},${startLocation.longitude}"
        "&destinations=${endLocation.latitude},${endLocation.longitude}"
        "&mode=$modeStr"
        "&key=$apiKey";

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200 && response.data['status'] == 'OK') {
        final element = response.data['rows'][0]['elements'][0];

        if (element['status'] == 'OK') {
          distance.value = element['distance']['text'];
          duration.value = element['duration']['text'];
          status.value = RxStatus.success();
        } else {
          distance.value = null;
          duration.value = "No Route";
          status.value = RxStatus.success();
        }
      }
    } catch (e) {
      debugPrint("Network Error: $e");
      status.value = RxStatus.error(e.toString());
    }
  }

  // fetches coordinate points to draw the route line
  Future<void> fetchRoutePolylines() async {
    PolylinePoints polylinePoints = PolylinePoints(apiKey: apiKey);

    try {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        request: PolylineRequest(
          origin: PointLatLng(startLocation.latitude, startLocation.longitude),
          destination: PointLatLng(endLocation.latitude, endLocation.longitude),
          mode: currentTravelMode.value,
        ),
      );

      if (result.points.isNotEmpty) {
        List<LatLng> coordinates = result.points
            .map((p) => LatLng(p.latitude, p.longitude))
            .toList();
        _routeCoordinates = coordinates;
        print("Total coordinates: ${coordinates.length}");

        polylines.clear();
        polylines.add(
          Polyline(
            polylineId: const PolylineId("route"),
            color: Colors.teal,
            points: coordinates,
            width: 5,
          ),
        );
        startSimulation();
        fitBounds();
      } else {
        debugPrint("No polyline points found");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}