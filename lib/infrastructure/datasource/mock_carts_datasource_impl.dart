import 'package:flutter_application_base/domain/datasource/cart/carts_datasource.dart';
import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';
import 'package:flutter_application_base/domain/entities/cart/product_cart_entity.dart';
import 'package:flutter_application_base/infrastructure/models/cart/carts_model.dart';
import 'package:flutter_application_base/mocks/carts.mock.dart';
import 'dart:developer';

class MockCartsDatasourceImpl implements CartsDatasource {
  @override
  Future<CartEntity> getCart(String id) async {
    //simulación de peticion a la api
    // await Future.delayed(const Duration(seconds: 2));
    final carts = getCarts();
    final CartEntity cart = (await carts).firstWhere((cart) => cart.id == id);

    return cart;
  }

  @override
  Future<List<CartEntity>> getCarts() async {
    //simulación de peticion a la api
    // await Future.delayed(const Duration(seconds: 2));
    final List<CartEntity> cartsList =
        carts.map((cart) => CartModel.fromJson(cart).toCartsEntity()).toList();

    return cartsList;
  }

  @override
  Future<void> addCartProduct(
      String id, ProductCartEntity productCartEntity) async {
    try {
      CartEntity cart = await getCart(id);
      cart.products.add(productCartEntity);
    } catch (e) {
      log(e.toString());
    }
    CartEntity cart = await getCart(id);
  }

  @override
  Future<void> deleteCart(String id) {
    // TODO: implement deleteCart
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(String id) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<CartEntity> addCart(CartEntity cart) {
    // TODO: implement addCart
    throw UnimplementedError();
  }
}
