import 'package:flutter_application_base/domain/entities/products_entity.dart';

abstract class ProductsDatasource {
  Future<ProductEntity> getProduct(int id);
  Future<List<ProductEntity>> getProducts();
}
