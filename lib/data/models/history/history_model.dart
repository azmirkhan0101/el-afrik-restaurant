
class HistoryModel {
  final String id;
  final int totalProducts;
  final double deliveryFee;
  final double price;
  final DateTime date;
  final String driverName;
  final String driverPhone;
  final String driverImageUrl;

  HistoryModel({
    required this.id,
    required this.totalProducts,
    required this.deliveryFee,
    required this.price,
    required this.date,
    required this.driverName,
    required this.driverPhone,
    required this.driverImageUrl,
  });

  /// --- JSON Serialization ---

  // Converts a Map (usually from an API response) into an OrderModel instance
  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'] as String,
      totalProducts: json['total_products'] as int,
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      // Handles ISO8601 strings from the server
      date: DateTime.parse(json['date'] as String),
      driverName: json['driver_name'] as String,
      driverPhone: json['driver_phone'] as String,
      driverImageUrl: json['driver_image_url'] as String,
    );
  }

  // Converts the OrderModel instance into a Map (to send to an API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total_products': totalProducts,
      'delivery_fee': deliveryFee,
      'price': price,
      'date': date.toIso8601String(),
      'driver_name': driverName,
      'driver_phone': driverPhone,
      'driver_image_url': driverImageUrl,
    };
  }

}