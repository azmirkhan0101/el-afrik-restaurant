class TopFlavoursModel {
  final String id;
  final String name;
  final String imageUrl;
  final String weightInfo;
  final double currentPrice;
  final double originalPrice;
  final bool isFavorite;

  TopFlavoursModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.weightInfo,
    required this.currentPrice,
    required this.originalPrice,
    this.isFavorite = false,
  });

  // Convert JSON Map to PizzaModel object
  factory TopFlavoursModel.fromJson(Map<String, dynamic> json) {
    return TopFlavoursModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
      weightInfo: json['weight_info'] as String,
      // Using .toDouble() ensures it handles both int and double from JSON
      currentPrice: (json['current_price'] as num).toDouble(),
      originalPrice: (json['original_price'] as num).toDouble(),
      isFavorite: json['is_favorite'] ?? false,
    );
  }

  // Convert PizzaModel object to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image_url': imageUrl,
      'weight_info': weightInfo,
      'current_price': currentPrice,
      'original_price': originalPrice,
      'is_favorite': isFavorite,
    };
  }
}