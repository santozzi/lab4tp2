import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/carts_entity.dart';

import '../../domain/repositories/carts_repository.dart';

class CartsProvider extends ChangeNotifier {
  final CartsRepository carritoRepository;
  int contador = 1;
  List<CartsEntity> carts = [];
  CartsEntity cart = CartsEntity(
      id: '',
      userId: '',
      date: '');
  CartsProvider({required this.carritoRepository});

  Future<void> getCarts() async {
    carts = await carritoRepository.getCarts();

    notifyListeners();
  }

  Future<CartsEntity> getCart(String id) async {
    cart = await carritoRepository.getCart(id);

    return cart;
  }

  void incrementCounter() {
    contador++;
    notifyListeners();
  }
}
