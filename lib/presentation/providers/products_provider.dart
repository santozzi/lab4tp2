import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';
import '../../domain/repositories/products_repository.dart';

class ProductsProvider extends ChangeNotifier {
  final ProductsRepository productsRepository;
  List<ProductEntity> products = [];
  ProductEntity product = ProductEntity(
      id: 0,
      title: '',
      price: 0.0,
      description: '',
      images: [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      category: '');
  ProductsProvider({required this.productsRepository});

  Future<void> getProducts() async {
    products = await productsRepository.getProducts();
    //notifyListeners();
  }

  Future<void> getProduct(int id) async {
    product = await productsRepository.getProduct(id);

    notifyListeners();
  }

  // Filtra los productos por categoría
  List<ProductEntity> getProductsByCategory(String categoryName) {
    return products
        .where((product) => product.category == categoryName)
        .toList();
  }

  // Filtra los productos según las IDs del carrito
  List<ProductEntity> getProductsByCart(CartEntity cart) {
    List<int> cartProductIds =
        cart.products.map((product) => product.productId).toList();
    return products
        .where((product) => cartProductIds.contains(product.id))
        .toList();
  }
}
