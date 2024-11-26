import 'package:flutter_application_base/domain/datasource/carts_datasource.dart';
import 'package:flutter_application_base/domain/entities/carts_entity.dart';
import 'package:flutter_application_base/domain/repositories/carts_repository.dart';

class CartsRepositoryImp implements CartsRepository {
  final CartsDatasource cartsDatasource;

  CartsRepositoryImp({required this.cartsDatasource});

  @override
  Future<CartsEntity> getCart(int id) {
    // TODO: implement getCart
    return cartsDatasource.getCart(id);
  }

  @override
  Future<List<CartsEntity>> getCarts() {
    // TODO: implement getCarts
    return cartsDatasource.getCarts();
  }
}