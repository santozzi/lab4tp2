import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/domain/entities/carts_entity.dart';
import 'package:flutter_application_base/domain/entities/products_cart_entity.dart';
import '../../domain/repositories/products_repository.dart';

class ProductsProvider extends ChangeNotifier {
  final ProductsRepository productsRepository;
  List<ProductsEntity> products = [];
  ProductsEntity product = ProductsEntity(
      id: 0,
      title: '',
      price: 0.0,
      description: '',
      images: [],
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: '');
  ProductsProvider({required this.productsRepository});

  Future<void> getProducts() async {
    products = await productsRepository.getProducts();
    notifyListeners();
  }

  Future<void> getProduct(int id) async {
    product = await productsRepository.getProduct(id);

    notifyListeners();
  }

  // Filtra los productos por categoría
  List<ProductsEntity> getProductsByCategory(String categoryName) {
    return products
        .where((product) => product.category == categoryName)
        .toList();
  }

  // Filtra los productos según las IDs del carrito
  List<ProductsEntity> getProductsByCart(CartsEntity cart) {
    List<int> cartProductIds = cart.products.map((product) => product.productId).toList();
    return products
      .where((product) => cartProductIds.contains(product.id))
      .toList();
  }
}
