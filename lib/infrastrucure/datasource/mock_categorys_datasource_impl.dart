import 'package:flutter_application_base/domain/datasource/categorys_datasource.dart';
import 'package:flutter_application_base/domain/entities/categorys_entity.dart';
import 'package:flutter_application_base/infrastrucure/models/categorys_model.dart';
import 'package:flutter_application_base/mocks/categorys.mock.dart';
import 'dart:developer';

class MockCategorysDatasourceImpl implements CategorysDatasource {
  @override
  Future<CategorysEntity> getCategory(int id) async {
    //simulación de peticion a la api.
    final categorys = getCategorys();
    final CategorysEntity category =
        (await categorys).firstWhere((category) => category.id == id);

    //Retorno de una categoria.
    return category;
  }

  @override
  Future<List<CategorysEntity>> getCategorys() async {
    //simulación de peticion a la api.
    final List<CategorysEntity> categorysList = categorys
        .map(
            (category) => CategorysModel.fromJson(category).toCategorysEntity())
        .toList();

    //Retorno de todas las categoria.
    return categorysList;
  }
}
