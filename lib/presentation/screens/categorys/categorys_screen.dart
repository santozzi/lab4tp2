import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/categorys_entity.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/presentation/providers/categorys_provider.dart';
import 'package:flutter_application_base/presentation/providers/products_provider.dart';
import 'package:flutter_application_base/presentation/widgets/categorys_card.dart';
import 'package:provider/provider.dart';

class CategorysScreen extends StatelessWidget {
  const CategorysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryprovider = context.watch<CategorysProvider>();
    final productsprovider = context.watch<ProductsProvider>();
    final colors = Theme.of(context).colorScheme;

    // Obtener las categorías desde el CategorysProvider
    categoryprovider.getCategorys();
    final List<CategorysEntity> categorys = categoryprovider.categorys;

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
          itemCount: categorys.length,
          itemBuilder: (context, index) {
            final category = categorys[index];

            // Filtrar los productos que pertenecen a la categoría actual
            final categoryProducts = allProducts
                .where((product) => product.category == category.name)
                .toList();

            return CategorysCard(
              category: category,
              allProducts: categoryProducts,
            );
          },
        ),
      ),
    );
  }
}
