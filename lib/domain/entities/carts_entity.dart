import 'package:flutter_application_base/domain/entities/products_cart_entity.dart';

class CartsEntity {
  final int id;
  final int userId;
  final DateTime date;
  // final List<ProductsCartEntity> products;


  CartsEntity({
    required this.id,
    required this.userId,
    required this.date,
    // required this.products,
  });
}