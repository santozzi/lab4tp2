import 'package:flutter_application_base/domain/datasource/products_datasource.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/domain/repositories/products_repository.dart';

class ProductsRepositoryImp implements ProductsRepository {
  final ProductsDatasource productsDatasource;

  ProductsRepositoryImp({required this.productsDatasource});

  @override
  Future<ProductsEntity> getProduct(int id) {
    // TODO: implement getProduct
    return productsDatasource.getProduct(id);
  }

  @override
  Future<List<ProductsEntity>> getProducts() {
    // TODO: implement getProducts
    return productsDatasource.getProducts();
  }
}