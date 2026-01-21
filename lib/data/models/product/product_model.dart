class ProductModel {
  final String id;
  final String imageUrl;
  final String name;
  final String description;
  final DateTime date;
  final String promoCode;
  final double price;
  final double? discountedPrice;
  final double weight;
  final double deliveryFee;
  final int points;
  final int calories;
  final String readyTime;
  final bool isFavourite;

  ProductModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.date,
    required this.promoCode,
    required this.price,
    required this.discountedPrice,
    required this.weight,
    required this.deliveryFee,
    required this.points,
    required this.calories,
    required this.readyTime,
    required this.isFavourite
  });

  // Factory constructor to create an instance from JSON/Map
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final images = json['images'] as List<dynamic>?;
    String firstImage = "";
    if (images is List && images.isNotEmpty) {
      firstImage = images[0] ?? "";
    }
    return ProductModel(
      id: json['id'] ?? '',
      imageUrl: firstImage,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      date: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()).toLocal(),
      promoCode: json['promo'] ?? '',
      price: ((json['price'] ?? 0.0) as num).toDouble(),
      discountedPrice: json['discountedPrice'] != null ? ((json['discountedPrice']) as num).toDouble() : null,
      weight: ((json['weight'] ?? 0.0) as num).toDouble(),
      deliveryFee: ((json['deliveryFee'] ?? 0.0) as num).toDouble(),
      points: json['points'] ?? 0,
        calories: json['calories'] ?? 0,
      readyTime: json['readyTime'] ?? "",
      isFavourite: json['isFavourite'] ?? false
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'images': [imageUrl],
      'name': name,
      'description': description,
      'createdAt': date.toUtc().toIso8601String(),
      'promo': promoCode,
      'price': price,
      'discountedPrice': discountedPrice,
      'weight': weight,
      'deliveryFee': deliveryFee,
      'points': points,
      'calories': calories,
      'readyTime': readyTime,
      'isFavourite': isFavourite
    };
  }
}