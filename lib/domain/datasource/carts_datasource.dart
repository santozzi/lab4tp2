import 'package:flutter_application_base/domain/entities/carts_entity.dart';

abstract class CartsDatasource {
  Future<CartsEntity> getCart(int id);
  Future<List<CartsEntity>> getCarts();
}