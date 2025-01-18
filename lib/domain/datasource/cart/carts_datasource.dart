import 'package:flutter_application_base/domain/datasource/cart/carts_products_datasource.dart';
import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';

abstract class CartsDatasource extends CartsProductsDatasource {
  Future<CartEntity> getCart(String id);
  Future<void> deleteCart(String id);
  Future<CartEntity> addCart(CartEntity cart);
}
