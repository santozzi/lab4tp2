import 'package:flutter_application_base/domain/entities/categorys_entity.dart';

class CategorysModel {
  final int id;
  final String name;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  CategorysModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.creationAt,
      required this.updatedAt});

  factory CategorysModel.fromJson(Map<String, dynamic> json) {
    return CategorysModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        creationAt: DateTime.parse(json['creationAt']),
        updatedAt: DateTime.parse(json['updatedAt']));
  }

  CategorysEntity toCategorysEntity() => CategorysEntity(
      id: id,
      name: name,
      image: image,
      creationAt: creationAt,
      updatedAt: updatedAt);
}
