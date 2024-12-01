import 'package:flutter_application_base/domain/entities/carts_entity.dart';
import 'package:flutter_application_base/domain/entities/products_cart_entity.dart';

class CartsModel {
  final int id;
  final int userId;
  final DateTime date;
  final List<ProductsCartEntity> products;

  CartsModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products
  });

  factory CartsModel.fromJson(Map<String, dynamic> json) {
    return CartsModel(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      products: (json['products'] as List<dynamic>)
          .map((product) => ProductsCartEntity.fromJson(product))
          .toList(),
    );
  }

  CartsEntity toCartsEntity() => CartsEntity(
      id: id,
      userId: userId,
      date: date,
      products: products);
}
