import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/presentation/providers/products_provider.dart';
import 'package:flutter_application_base/presentation/widgets/products_card.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  final String? categoryName; // Recibimos solo el nombre de la categoría.

  const ProductsScreen({super.key, this.categoryName});

  @override
  Widget build(BuildContext context) {
    final productprovider = context.watch<ProductsProvider>();
    final colors = Theme.of(context).colorScheme;

    productprovider.getProducts(); // Obtener todos los productos.

    // Filtramos los productos por el nombre de la categoría, si se pasa alguno.
    List<ProductsEntity> products;

    if (categoryName != null) {
      products = productprovider.products
          .where((product) =>
              product.category ==
              categoryName) // Filtramos por nombre de la categoría.
          .toList();
    } else {
      products = productprovider
          .products; // Si no hay nombre, mostramos todos los productos.
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: colors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: products.isEmpty
            ? const Text(
                'No se encontraron productos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductsCard(product: products[index]);
                },
              ),
      ),
    );
  }
}
