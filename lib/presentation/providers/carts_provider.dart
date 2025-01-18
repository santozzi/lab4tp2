import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';
import 'package:flutter_application_base/domain/entities/cart/product_cart_entity.dart';
import 'package:flutter_application_base/domain/entities/product_cart_entity.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/domain/repositories/repositories.dart';

import '../../domain/repositories/cart/carts_repository.dart';

class CartsProvider extends ChangeNotifier {
  final CartsRepository cartsRepository;
  final ProductsRepository productsRepository;
  List<CartEntity> carts = [];
  double total = 0;
  int quantity = 0;
  CartEntity cart =
      CartEntity(id: "0", userId: "0", date: DateTime.now(), products: []);
  CartsProvider(
      {required this.cartsRepository, required this.productsRepository});

/*   Future<void> getCarts() async {
    carts = await cartsRepository.getCarts();

    notifyListeners();
  } */

  Future<void> getCart(String id) async {
    cart = await cartsRepository.getCart(id);

    notifyListeners();
  }

  Future<void> addProduct(ProductCartEntity product) async {
    log("Estoy en addProducto provider ${cart.id}");
    await cartsRepository.addCartProduct(cart.id, product);
    quantity += product.quantity;
    notifyListeners();
  }

  Future<List<ProductCartQEntity>> getProducts() async {
    total = 0;
    quantity = 0;
    List<ProductCartQEntity> products = [];
    for (ProductCartEntity product in cart.products) {
      ProductEntity productEntity =
          await productsRepository.getProduct(product.productId);
      ProductCartQEntity productCartQEntity = ProductCartQEntity(
          id: productEntity.id,
          title: productEntity.title,
          price: productEntity.price,
          description: productEntity.description,
          images: productEntity.images,
          createdAt: productEntity.createdAt,
          updatedAt: productEntity.updatedAt,
          category: productEntity.category,
          quantity: product.quantity);
      total += productCartQEntity.subTotal;
      quantity += product.quantity;
      products.add(productCartQEntity);
    }
    return products;
  }
}
