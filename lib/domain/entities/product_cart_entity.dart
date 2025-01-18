import 'package:flutter_application_base/domain/entities/products_entity.dart';

class ProductCartQEntity extends ProductEntity {
  int quantity;
  double get subTotal => price * quantity;
  ProductCartQEntity(
      {required super.id,
      required super.title,
      required super.price,
      required super.description,
      required super.images,
      required super.createdAt,
      required super.updatedAt,
      required super.category,
      required this.quantity});
}
