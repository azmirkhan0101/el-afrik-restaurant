import 'package:el_afrik_restaurant/screens/order/track_rider/widgets/travel_mode_selector.dart';
import 'package:el_afrik_restaurant/screens/order/track_rider/widgets/travel_stats_card.dart';
import 'package:el_afrik_restaurant/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'controller/track_rider_controller.dart';

class TrackRiderScreen extends StatelessWidget {
  const TrackRiderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MapRouteController controller = Get.put(MapRouteController());

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.viewMapRoute.tr),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black,
          fontSize: 20,
        ),
        actions: [TravelModeSelector(controller: controller)],
      ),
      body: Stack(
        children: [
          // map
          Obx(() {
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: MapRouteController.startLocation,
                zoom: 7,
              ),
              markers: controller.markers.toSet(),
              polylines: controller.polylines.toSet(),
              onMapCreated: controller.onMapCreated,
            );
          }),

          // time & distance
          TravelStatsCard(controller: controller),
        ],
      ),
    );
  }
}
