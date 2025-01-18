import 'package:flutter_application_base/domain/entities/category_entity.dart';

class CategoryModel {
  final int id;
  final String name;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.creationAt,
      required this.updatedAt});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        creationAt: DateTime.parse(json['creationAt']),
        updatedAt: DateTime.parse(json['updatedAt']));
  }

  CategoryEntity toCategoryEntity() => CategoryEntity(
      id: id,
      name: name,
      image: image,
      creationAt: creationAt,
      updatedAt: updatedAt);
}
