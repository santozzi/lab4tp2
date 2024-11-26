import 'package:flutter_application_base/domain/datasource/carts_datasource.dart';
import 'package:flutter_application_base/domain/entities/carts_entity.dart';
import 'package:flutter_application_base/infrastrucure/models/carts_model.dart';
import 'package:flutter_application_base/mocks/carts.mock.dart';
import 'dart:developer';

class MockCartsDatasourceImpl implements CartsDatasource {
  @override
  Future<CartsEntity> getCart(int id) async {
    //simulación de peticion a la api
    // await Future.delayed(const Duration(seconds: 2));
    final carts = getCarts();
    final CartsEntity cart =
        (await carts).firstWhere((cart) => cart.id == id);

    return cart;
  }

  @override
  Future<List<CartsEntity>> getCarts() async {
    //simulación de peticion a la api
    // await Future.delayed(const Duration(seconds: 2));
    final List<CartsEntity> cartsList = carts
        .map((cart) => CartsModel.fromJson(cart).toCartsEntity())
        .toList();

    return cartsList;
  }
}
