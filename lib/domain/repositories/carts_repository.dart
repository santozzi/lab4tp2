import 'package:flutter_application_base/domain/entities/carts_entity.dart';

abstract class CartsRepository {
  Future<CartsEntity> getCart(String id);
  Future<List<CartsEntity>> getCarts();
}