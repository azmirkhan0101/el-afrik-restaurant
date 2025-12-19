class OrderedItemModel {
  final String imageUrl;
  final String name;
  final String quantity;
  final String price;
  final String point;

  OrderedItemModel({
    required this.imageUrl,
    required this.name,
    required this.quantity,
    required this.price,
    required this.point,
  });

  // Convert a JSON Map into a Product object
  factory OrderedItemModel.fromJson(Map<String, dynamic> json) {
    return OrderedItemModel(
      imageUrl: json['imageUrl'] ?? '',
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? '',
      price: json['price'] ?? '',
      point: json['point'] ?? '',
    );
  }

  // Convert a Product object into a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'quantity': quantity,
      'price': price,
      'point': point,
    };
  }
}