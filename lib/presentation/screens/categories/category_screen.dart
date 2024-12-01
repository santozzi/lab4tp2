import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/categories_entity.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/presentation/providers/products_provider.dart';
import 'package:flutter_application_base/presentation/screens/products/products_screen.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final CategoriesEntity category;
  final List<ProductsEntity> products;

  const CategoryScreen({
    super.key,
    required this.category,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final productProvider = context.watch<ProductsProvider>();

    // Llamamos a getProducts solo si la lista de productos está vacía
    if (productProvider.products.isEmpty) {
      productProvider.getProducts(); // Obtener productos si no están cargados.
    }

    // Filtramos los productos por el nombre de la categoría.
    List<ProductsEntity> categoryProducts;
    categoryProducts = productProvider.products
        .where((product) => product.category == category.name)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categoría'),
        backgroundColor: colors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título de la categoría
            Text(
              category.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Imagen de la categoría
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  category.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Cantidad de productos
            Text(
              'Cantidad de productos: ${categoryProducts.isEmpty ? 0 : categoryProducts.length}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),

            // Boton
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductsScreen(
                      categoryName: category
                          .name, // Pasamos solo el nombre de la categoría.
                    ),
                  ),
                );
              },
              child: const Text('Ver productos'),
            ),
          ],
        ),
      ),
    );
  }
}
