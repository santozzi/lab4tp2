import 'dart:developer';

import 'package:flutter_application_base/config/env/connection_backend_config.dart';
import 'package:flutter_application_base/domain/datasource/categories_datasource.dart';
import 'package:flutter_application_base/domain/datasource/products_datasource.dart';
import 'package:flutter_application_base/domain/datasource/user/user_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_base/domain/entities/category_entity.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/domain/entities/user/user_entity.dart';
import 'package:flutter_application_base/domain/repositories/token_preferences_repository.dart';
import 'package:flutter_application_base/infrastrucure/datasource/user/shared_token_preferences_datasource_imp.dart';
import 'package:flutter_application_base/infrastrucure/models/category_model.dart';
import 'package:flutter_application_base/infrastrucure/models/products_model.dart';
import 'package:flutter_application_base/infrastrucure/models/user_model.dart';
import 'package:flutter_application_base/infrastrucure/repositories/token_repository_imp.dart';

class CategoriesDatasourceImp implements CategoriesDatasource {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ConnectionBackendConfig().init(),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  CategoriesDatasourceImp();

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final response = await dio.get('/categories');
      final datos = await response.data;

      if (datos == null) {
        throw Exception("No se encontraron categorías");
      }

      List<CategoryEntity> categorias = [];
      for (var i = 0; i < datos.length; i++) {
        CategoryEntity categoria =
            CategoryModel.fromJson(datos[i]).toCategoryEntity();

        categorias.add(categoria);
      }

      return categorias;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  @override
  Future<CategoryEntity> getCategory(int id) async {
    try {
      final response = await dio.get("/categories/$id");
      final dato = await response.data;

      if (dato == null) {
        throw Exception("No se encontraron categoria");
      }

      CategoryEntity categoria =
          CategoryModel.fromJson(dato).toCategoryEntity();

      return categoria;
    } catch (e) {
      log(e.toString());
      throw Error();
    }
  }
}
