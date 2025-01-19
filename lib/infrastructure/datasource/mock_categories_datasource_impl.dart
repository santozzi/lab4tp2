import 'package:flutter_application_base/domain/datasource/categories_datasource.dart';
import 'package:flutter_application_base/domain/entities/category_entity.dart';
import 'package:flutter_application_base/infrastructure/models/category_model.dart';
import 'package:flutter_application_base/mocks/categories.mock.dart';
import 'dart:developer';

class MockCategoriesDatasourceImpl implements CategoriesDatasource {
  @override
  Future<CategoryEntity> getCategory(int id) async {
    //simulación de peticion a la api.
    final categories = getCategories();
    final CategoryEntity category =
        (await categories).firstWhere((category) => category.id == id);

    //Retorno de una categoria.
    return category;
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    //simulación de peticion a la api.
    final List<CategoryEntity> categoriesList = categories
        .map((category) => CategoryModel.fromJson(category).toCategoryEntity())
        .toList();

    //Retorno de todas las categoria.
    return categoriesList;
  }
}
