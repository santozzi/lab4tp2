import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';

import '../../domain/repositories/cart/carts_repository.dart';

class CartsProvider extends ChangeNotifier {
  final CartsRepository cartsRepository;
  List<CartEntity> carts = [];
  CartEntity cart =
      CartEntity(id: "0", userId: "0", date: DateTime.now(), products: []);
  CartsProvider({required this.cartsRepository});

/*   Future<void> getCarts() async {
    carts = await cartsRepository.getCarts();

    notifyListeners();
  } */

  Future<void> getCart(String id) async {
    cart = await cartsRepository.getCart(id);

    notifyListeners();
  }
}
