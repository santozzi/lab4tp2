import 'package:flutter_application_base/domain/entities/cart/product_cart_entity.dart';

abstract class CartsProductsDatasource {
  Future<void> addCartProduct(
      String idCart, ProductCartEntity productCartEntity);
  Future<void> deleteItem(String id);
}
