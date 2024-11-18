import 'package:flutter_application_base/domain/datasource/products_datasource.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/infrastrucure/models/products_model.dart';
import 'package:flutter_application_base/mocks/products.mock.dart';
import 'dart:developer';

class MockProductsDatasourceImpl implements ProductsDatasource {
  @override
  Future<ProductsEntity> getProduct(int id) async {
    //simuación de peticion a la api
    // await Future.delayed(const Duration(seconds: 2));
    final productos = getProducts();
    final ProductsEntity producto =
        (await productos).firstWhere((producto) => producto.id == id);

    return producto;
  }

  @override
  Future<List<ProductsEntity>> getProducts() async {
    //simuación de peticion a la api
    // await Future.delayed(const Duration(seconds: 2));
    final List<ProductsEntity> productsList = products
        .map((product) => ProductsModel.fromJson(product).toProductsEntity())
        .toList();

    return productsList;
  }
}
