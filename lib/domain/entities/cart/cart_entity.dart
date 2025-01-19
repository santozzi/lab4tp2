import 'package:flutter_application_base/domain/entities/cart/product_cart_entity.dart';

class CartEntity {
  final String id;
  final String userId;
  final DateTime date;
  final List<ProductCartEntity> products;

  CartEntity({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });
  @override
  String toString() {
    return '{id: $id, userId: $userId, date: $date, products: $products}';
  }
}
