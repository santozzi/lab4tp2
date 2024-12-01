import 'package:flutter_application_base/domain/datasource/categories_datasource.dart';
import 'package:flutter_application_base/domain/entities/categories_entity.dart';
import 'package:flutter_application_base/infrastrucure/models/categories_model.dart';
import 'package:flutter_application_base/mocks/categories.mock.dart';
import 'dart:developer';

class MockCategoriesDatasourceImpl implements CategoriesDatasource {
  @override
  Future<CategoriesEntity> getCategory(int id) async {
    //simulación de peticion a la api.
    final categories = getCategories();
    final CategoriesEntity category =
        (await categories).firstWhere((category) => category.id == id);

    //Retorno de una categoria.
    return category;
  }

  @override
  Future<List<CategoriesEntity>> getCategories() async {
    //simulación de peticion a la api.
    final List<CategoriesEntity> categoriesList = categories
        .map((category) =>
            CategoriesModel.fromJson(category).toCategoriesEntity())
        .toList();

    //Retorno de todas las categoria.
    return categoriesList;
  }
}
