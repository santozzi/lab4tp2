import 'package:flutter_application_base/domain/datasource/categorys_datasource.dart';
import 'package:flutter_application_base/domain/entities/categorys_entity.dart';
import 'package:flutter_application_base/domain/repositories/categorys_repository.dart';

class CategorysRepositoryImp implements CategorysRepository {
  final CategorysDatasource categorysDatasource;

  CategorysRepositoryImp({required this.categorysDatasource});

  @override
  Future<CategorysEntity> getCategory(int id) {
    // TODO: implement getCategory.
    return categorysDatasource.getCategory(id);
  }

  @override
  Future<List<CategorysEntity>> getCategorys() {
    // TODO: implement getCategorys.
    return categorysDatasource.getCategorys();
  }
}
