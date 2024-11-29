import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/categorys_entity.dart';

import '../../domain/repositories/categorys_repository.dart';

class CategorysProvider extends ChangeNotifier {
  final CategorysRepository categorysRepository;
  List<CategorysEntity> categorys = [];

  CategorysEntity category = CategorysEntity(
      id: 0,
      name: '',
      image: '',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now());

  CategorysProvider({required this.categorysRepository});

  Future<void> getCategorys() async {
    categorys = await categorysRepository.getCategorys();
    notifyListeners();
  }

  Future<void> getCategory(int id) async {
    category = await categorysRepository.getCategory(id);

    notifyListeners();
  }
}
