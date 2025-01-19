import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';
import 'package:flutter_application_base/infrastructure/models/cart/carts_model.dart';

class CartListPreferncesModel {
  final List<CartModel> cartPreferenceModel;

  CartListPreferncesModel({required this.cartPreferenceModel});

  // Convertir la lista de entidades a JSON
  Map<String, dynamic> toJson() {
    return {
      'carts': cartPreferenceModel.map((e) => e.toJson()).toList(),
    };
  }

  // Crear una lista de entidades desde JSON
  factory CartListPreferncesModel.fromJson(Map<String, dynamic> json) {
    return CartListPreferncesModel(
      cartPreferenceModel:
          (json['carts'] as List).map((e) => CartModel.fromJson(e)).toList(),
    );
  }
  List<CartEntity> toCartEntityList() {
    return cartPreferenceModel
        .map((e) => CartEntity(
              id: e.id,
              userId: e.userId,
              date: e.date,
              products: e.products.map((e) => e.toProductCartEntity()).toList(),
            ))
        .toList();
  }
}
