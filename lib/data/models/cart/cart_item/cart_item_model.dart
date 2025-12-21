class CartItemModel {
  final String id;
  final String title;
  final String restaurantName;
  final String imageUrl;
  final double price;
  final int quantity;

  CartItemModel({
    required this.id,
    required this.title,
    required this.restaurantName,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });

  // 1. Convert Map (JSON) to CartItemModel object
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
      restaurantName: json['restaurant_name'] as String,
      imageUrl: json['image_url'] as String,
      // Handle potential double/int types from JSON safely
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int? ?? 1,
    );
  }

  // 2. Convert CartItemModel object to Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'restaurant_name': restaurantName,
      'image_url': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }

  // 3. Helper for state updates
  CartItemModel copyWith({int? quantity}) {
    return CartItemModel(
      id: id,
      title: title,
      restaurantName: restaurantName,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}