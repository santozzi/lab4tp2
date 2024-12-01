import 'package:flutter_application_base/domain/datasource/categories_datasource.dart';
import 'package:flutter_application_base/domain/entities/categories_entity.dart';
import 'package:flutter_application_base/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImp implements CategoriesRepository {
  final CategoriesDatasource categoriesDatasource;

  CategoriesRepositoryImp({required this.categoriesDatasource});

  @override
  Future<CategoriesEntity> getCategory(int id) {
    return categoriesDatasource.getCategory(id);
  }

  @override
  Future<List<CategoriesEntity>> getCategories() {
    return categoriesDatasource.getCategories();
  }
}
