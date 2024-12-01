import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/categories_entity.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/presentation/providers/categories_provider.dart';
import 'package:flutter_application_base/presentation/providers/products_provider.dart';
import 'package:flutter_application_base/presentation/widgets/categories_card.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryprovider = context.watch<CategoriesProvider>();
    final productsprovider = context.watch<ProductsProvider>();
    final colors = Theme.of(context).colorScheme;

    // Obtener las categorías desde el CategoriesProvider
    categoryprovider.getCategories();
    final List<CategoriesEntity> categories = categoryprovider.categories;

    // Obtener los productos desde el ProductsProvider
    final List<ProductsEntity> allProducts = productsprovider.products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
        backgroundColor: colors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.5,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];

            // Filtrar los productos que pertenecen a la categoría actual
            final categoryProducts = allProducts
                .where((product) => product.category == category.name)
                .toList();

            return CategoriesCard(
              category: category,
              allProducts: categoryProducts,
            );
          },
        ),
      ),
    );
  }
}
