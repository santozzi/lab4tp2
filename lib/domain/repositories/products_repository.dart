import 'package:flutter_application_base/domain/entities/products_entity.dart';

abstract class ProductsRepository {
  Future<ProductEntity> getProduct(String id);
  Future<List<ProductEntity>> getProducts();
}
