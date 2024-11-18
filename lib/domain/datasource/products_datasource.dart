import 'package:flutter_application_base/domain/entities/products_entity.dart';

abstract class ProductsDatasource {
  Future<ProductsEntity> getProduct(int id);
  Future<List<ProductsEntity>> getProducts();
}
