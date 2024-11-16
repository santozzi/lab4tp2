import 'package:flutter_application_base/domain/entities/products_entity.dart';

class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final DateTime creationAt;
  final DateTime updatedAt;
  final String /*CategoryEntity*/ category;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    this.description = "",
    required this.images,
    required this.creationAt,
    required this.updatedAt,
    required this.category,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      images: json['images'],
      creationAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      category: json["category"]["name"] //despues se modifica cuando leo haga sus categorias,
    );
  }

  ProductsEntity toProductsEntity() => ProductsEntity(
      id: id,
      title: title,
      price: price,
      description: description,
      images: images,
      creationAt: creationAt,
      updatedAt: updatedAt,
      category: category);
}
