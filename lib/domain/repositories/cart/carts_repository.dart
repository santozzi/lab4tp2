import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';
import 'package:flutter_application_base/domain/repositories/cart/carts_products_repository.dart';

abstract class CartsRepository extends CartsProductsRepository {
  Future<CartEntity> getCart(String id);
  Future<void> deleteCart(String id);
  Future<CartEntity> addCart(CartEntity cart);
}
