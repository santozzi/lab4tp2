import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_base/domain/entities/products_entity.dart';

class ProductModel {
  final String id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String /*CategoryEntity*/ category;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<String> imageList = [];
    for (var i = 0; i < json['images'].length; i++) {
      String image = json['images'][i] as String;

      imageList.add(image);
    }

    return ProductModel(
        id: "${json['id']}",
        title: json['title'],
        price: (json['price'] as num).toDouble(),
        description: json['description'],
        images: imageList,
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        category: json["category"]
            ["name"] //despues se modifica cuando leo haga sus categorias,
        );
  }

  ProductEntity toProductEntity() => ProductEntity(
      id: id,
      title: title,
      price: price,
      description: description,
      images: images,
      createdAt: createdAt,
      updatedAt: updatedAt,
      category: category);
}
