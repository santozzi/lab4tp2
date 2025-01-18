import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';
import '../../domain/repositories/products_repository.dart';

class ProductsProvider extends ChangeNotifier {
  final ProductsRepository productsRepository;
  List<ProductEntity> products = [];
  ProductEntity product = ProductEntity(
      id: "0",
      title: '',
      price: 0.0,
      description: '',
      images: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: '');
  ProductsProvider({required this.productsRepository});

  Future<List<ProductEntity>> getProducts() async {
    try {
      products = await productsRepository.getProducts();
      return products;
    } catch (e) {
      log("Error en getProducts provider: ${e.toString()}");
      return [];
    }

    //notifyListeners();
  }

  Future<List<ProductEntity>> getFilteredProducts(
      String categoryName, String searchQuery) async {
    try {
      products = await productsRepository.getProducts();

      return products
          .where((product) =>
              (categoryName == "" || product.category == categoryName) &&
              (product.title.toLowerCase().contains(searchQuery.toLowerCase())))
          .toList();
    } catch (e) {
      log("Error en getProducts provider: ${e.toString()}");
      return [];
    }
  }

  Future<ProductEntity> getProduct(String id) async {
    product = await productsRepository.getProduct(id);

    notifyListeners();
    return product;
  }

  // Filtra los productos por categoría
  List<ProductEntity> getProductsByCategory(String categoryName) {
    return products
        .where((product) => product.category == categoryName)
        .toList();
  }

  // Filtra los productos según las IDs del carrito
  List<ProductEntity> getProductsByCart(CartEntity cart) {
    List<String> cartProductIds =
        cart.products.map((product) => product.productId).toList();
    return products
        .where((product) => cartProductIds.contains(product.id))
        .toList();
  }
}
