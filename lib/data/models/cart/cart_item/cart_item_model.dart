import 'package:get/get.dart';

class CartItemModel {
  String id;
  String name;
  String imageUrl;
  double price;
  int quantity;

  RxBool isUpdating = false.obs;

  CartItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    final product = json['product'];
    final images = product['images'] as List<dynamic>?;
    String image = "";
    if (images is List && images.isNotEmpty) {
      image = images[0] ?? "";
    }

    return CartItemModel(
      id: product['id'] ?? "",
      name: product['name'] ?? "",
      imageUrl: image,
      price: ((json['total'] as num?) ?? 0.00).toDouble(),
      quantity: json['quantity'] as int? ?? 1,
    );
  }

  CartItemModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? price,
    int? quantity,
}) {
    return CartItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity
    );
  }
}
