class PromoEventsModel {
  final String id;
  final String imageUrl;
  final String name;
  final String description;
  final DateTime date;
  final String promoCode;
  final double discountPercentage;

  PromoEventsModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.date,
    required this.promoCode,
    required this.discountPercentage,
  });

  // Factory constructor to create an instance from JSON/Map
  factory PromoEventsModel.fromJson(Map<String, dynamic> json) {
    final images = json['images'] as List<dynamic>?;
    String firstImage = "";
    if (images is List && images.isNotEmpty) {
      firstImage = images[0] ?? "";
    }
    return PromoEventsModel(
      id: json['_id'] ?? '',
      imageUrl: firstImage,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      date: DateTime.parse(json['createdAt'] ?? DateTime.now()).toLocal(),
      promoCode: json['promo'] ?? '',
      discountPercentage: (json['discountPercentage'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'imageUrl': imageUrl,
      'title': name,
      'description': description,
      'createdAt': date.toUtc().toIso8601String(),
      'promo': promoCode,
      'discountPercentage': discountPercentage,
    };
  }
}