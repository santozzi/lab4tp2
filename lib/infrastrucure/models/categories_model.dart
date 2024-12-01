import 'package:flutter_application_base/domain/entities/categories_entity.dart';

class CategoriesModel {
  final int id;
  final String name;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  CategoriesModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.creationAt,
      required this.updatedAt});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        creationAt: DateTime.parse(json['creationAt']),
        updatedAt: DateTime.parse(json['updatedAt']));
  }

  CategoriesEntity toCategoriesEntity() => CategoriesEntity(
      id: id,
      name: name,
      image: image,
      creationAt: creationAt,
      updatedAt: updatedAt);
}
