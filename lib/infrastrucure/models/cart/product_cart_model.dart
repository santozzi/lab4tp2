import 'package:flutter_application_base/domain/entities/cart/product_cart_entity.dart';

class ProductCartModel {
  final int productId;
  final int quantity;
  // Agregar listado de productos

  ProductCartModel({required this.productId, required this.quantity});

  factory ProductCartModel.fromJson(Map<String, dynamic> json) {
    return ProductCartModel(
        productId: json['productId'], quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }

  ProductCartEntity toProductCartEntity() =>
      ProductCartEntity(productId: productId, quantity: quantity);
}
