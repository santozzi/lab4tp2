import 'dart:developer';

import 'package:flutter_application_base/config/env/connection_backend_config.dart';
import 'package:flutter_application_base/domain/datasource/products_datasource.dart';
import 'package:flutter_application_base/domain/datasource/user/user_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/domain/entities/user/user_entity.dart';
import 'package:flutter_application_base/domain/repositories/token_preferences_repository.dart';
import 'package:flutter_application_base/infrastrucure/datasource/user/shared_token_preferences_datasource_imp.dart';
import 'package:flutter_application_base/infrastrucure/models/products_model.dart';
import 'package:flutter_application_base/infrastrucure/models/user_model.dart';
import 'package:flutter_application_base/infrastrucure/repositories/token_repository_imp.dart';

class ProductDatasoureceImp implements ProductsDatasource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ConnectionBackendConfig().init(),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  ProductDatasoureceImp();

  @override
  Future<ProductEntity> getProduct(int id) async {
    try {
      final response = await dio.get("/products/$id");
      final dato = await response.data;

      if (dato == null) {
        throw Exception("No se encontraron productos");
      }

      ProductEntity producto = ProductModel.fromJson(dato).toProductEntity();

      return producto;
    } catch (e) {
      log(e.toString());
      throw Error();
    }
  }

  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      final response = await dio.get('/products');
      final datos = await response.data;

      if (datos == null) {
        throw Exception("No se encontraron productos");
      }
      //og(datos[0].toString());
      List<ProductEntity> productos = [];
      for (var i = 0; i < datos.length; i++) {
        ProductEntity producto =
            ProductModel.fromJson(datos[i]).toProductEntity();

        productos.add(producto);
      }

      return productos;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
