import 'package:flutter_application_base/domain/entities/categories_entity.dart';

abstract class CategoriesRepository {
  Future<CategoriesEntity> getCategory(int id);
  Future<List<CategoriesEntity>> getCategories();
}
