import 'package:flutter_application_base/domain/entities/category_entity.dart';

abstract class CategoriesRepository {
  Future<CategoryEntity> getCategory(int id);
  Future<List<CategoryEntity>> getCategories();
}
