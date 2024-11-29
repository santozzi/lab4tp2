import 'package:flutter_application_base/domain/entities/categorys_entity.dart';

abstract class CategorysRepository {
  Future<CategorysEntity> getCategory(int id);
  Future<List<CategorysEntity>> getCategorys();
}
