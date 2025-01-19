import 'package:flutter_application_base/domain/datasource/cart/carts_datasource.dart';
import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';
import 'package:flutter_application_base/domain/entities/cart/product_cart_entity.dart';
import 'package:flutter_application_base/domain/repositories/cart/carts_repository.dart';

class CartsRepositoryImp implements CartsRepository {
  final CartsDatasource cartsDatasource;

  CartsRepositoryImp({required this.cartsDatasource});

  @override
  Future<void> addCartProduct(
      String idCart, ProductCartEntity productCartEntity) async {
    cartsDatasource.addCartProduct(idCart, productCartEntity);
  }

  @override
  Future<void> deleteCart(String id) async {
    cartsDatasource.deleteCart(id);
  }

  @override
  Future<void> deleteItem(String id) {
    return cartsDatasource.deleteItem(id);
  }

  @override
  Future<CartEntity> getCart(String id) {
    return cartsDatasource.getCart(id);
  }

  @override
  Future<CartEntity> addCart(CartEntity cart) {
    return cartsDatasource.addCart(cart);
  }
}
