import 'package:json_annotation/json_annotation.dart';
import 'product.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  final int id;
  final int userId;
  final String date;
  final List<CartProduct> products;

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  // Helper methods for UI
  double get totalPrice {
    return products.fold(0.0, (sum, cartProduct) => sum + cartProduct.totalPrice);
  }

  double get shippingCost => 5.0; // Fixed shipping cost
  double get finalTotal => totalPrice + shippingCost;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()
class CartProduct {
  final int productId;
  final int quantity;

  CartProduct({
    required this.productId,
    required this.quantity,
  });

  // These fields will be populated when we fetch product details
  Product? product;
  String? size;

  double get totalPrice {
    if (product != null) {
      return product!.price * quantity;
    }
    return 0.0;
  }

  factory CartProduct.fromJson(Map<String, dynamic> json) => _$CartProductFromJson(json);
  Map<String, dynamic> toJson() => _$CartProductToJson(this);
}