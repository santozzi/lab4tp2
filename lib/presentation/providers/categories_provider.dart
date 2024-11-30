import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/categories_entity.dart';

import '../../domain/repositories/categories_repository.dart';

class CategoriesProvider extends ChangeNotifier {
  final CategoriesRepository categoriesRepository;
  List<CategoriesEntity> categories = [];

  CategoriesEntity category = CategoriesEntity(
      id: 0,
      name: '',
      image: '',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now());

  CategoriesProvider({required this.categoriesRepository});

  Future<void> getCategories() async {
    categories = await categoriesRepository.getCategories();
    notifyListeners();
  }

  Future<void> getCategory(int id) async {
    category = await categoriesRepository.getCategory(id);

    notifyListeners();
  }
}
