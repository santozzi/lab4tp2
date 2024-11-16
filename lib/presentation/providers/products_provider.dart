import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';

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
}
