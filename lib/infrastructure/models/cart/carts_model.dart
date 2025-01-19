import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';
import 'package:flutter_application_base/infrastructure/models/cart/product_cart_model.dart';

class CartModel {
  final String id;
  final String userId;
  final DateTime date;
  final List<ProductCartModel> products;

  CartModel(
      {required this.id,
      required this.userId,
      required this.date,
      required this.products});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    List<ProductCartModel> productCartEntityList = [];
    for (var product in json['products']) {
      productCartEntityList.add(ProductCartModel.fromJson(product));
    }

    return CartModel(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products: productCartEntityList,
    );
  }
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> productCartEntityList = [];
    for (var product in products) {
      productCartEntityList.add(ProductCartModel(
              productId: product.productId, quantity: product.quantity)
          .toJson());
    }

    return {
      'id': id,
      'userId': userId,
      'date': date.toString(),
      'products': productCartEntityList,
    };
  }

  CartEntity toCartsEntity() => CartEntity(
      id: id,
      userId: userId,
      date: date,
      products: products.map((e) => e.toProductCartEntity()).toList());
}
