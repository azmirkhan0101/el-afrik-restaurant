class PromoEventsModel {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final String date;
  final String promoCode;
  final double discountPercentage;

  PromoEventsModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
    required this.promoCode,
    required this.discountPercentage,
  });

  // Factory constructor to create an instance from JSON/Map
  factory PromoEventsModel.fromMap(Map<String, dynamic> map) {
    return PromoEventsModel(
      id: map['id'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      date: map['date'] ?? '',
      promoCode: map['promoCode'] ?? '',
      discountPercentage: (map['discountPercentage'] ?? 0.0).toDouble(),
    );
  }

  // Method to convert instance back to a Map (useful for API posts)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'description': description,
      'date': date,
      'promoCode': promoCode,
      'discountPercentage': discountPercentage,
    };
  }
}