import 'package:flutter_application_base/domain/entities/category_entity.dart';

abstract class CategoriesDatasource {
  Future<CategoryEntity> getCategory(int id);
  Future<List<CategoryEntity>> getCategories();
}
