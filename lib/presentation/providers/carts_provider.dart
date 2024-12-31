import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/carts_entity.dart';

import '../../domain/repositories/carts_repository.dart';

class CartsProvider extends ChangeNotifier {
  final CartsRepository cartsRepository;
  List<CartsEntity> carts = [];
  CartsEntity cart = CartsEntity(
      id: 0,
      userId: 0,
      date: DateTime.now(),
      products: []);
  CartsProvider({required this.cartsRepository});

  Future<void> getCarts() async {
    carts = await cartsRepository.getCarts();

    notifyListeners();
  }

  Future<void> getCart(int id) async {
    cart = await cartsRepository.getCart(id);

    
    notifyListeners();
  }

}
