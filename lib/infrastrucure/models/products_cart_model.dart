import 'package:flutter_application_base/domain/entities/products_cart_entity.dart';

class ProductsCartModel {
  final int productId;
  final int quantity;
  // Agregar listado de productos

  ProductsCartModel({
    required this.productId,
    required this.quantity
  });

  factory ProductsCartModel.fromJson(Map<String, dynamic> json) {
    return ProductsCartModel(
      productId: json['productId'],
      quantity: json['quantity']
    );
  }

  ProductsCartEntity toProductsCartEntity() => ProductsCartEntity(
      productId: productId,
      quantity: quantity);
}
