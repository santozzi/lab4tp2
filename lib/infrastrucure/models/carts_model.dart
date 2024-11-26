import 'package:flutter_application_base/domain/entities/carts_entity.dart';

class CartsModel {
  final int id;
  final int userId;
  final DateTime date;
  // Agregar listado de productos

  CartsModel({
    required this.id,
    required this.userId,
    required this.date
  });

  factory CartsModel.fromJson(Map<String, dynamic> json) {
    return CartsModel(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['creationAt']),
    );
  }

  CartsEntity toCartsEntity() => CartsEntity(
      id: id,
      userId: userId,
      date: date);
}
