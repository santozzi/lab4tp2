import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/categorys_entity.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/presentation/screens/products/products_screen.dart';
import 'package:flutter_application_base/presentation/screens/categorys/category_screen.dart';

class CategorysCard extends StatelessWidget {
  final CategorysEntity category;
  final List<ProductsEntity> allProducts; // Lista completa de productos.

  const CategorysCard({
    super.key,
    required this.category,
    required this.allProducts,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: colors.primaryContainer,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: colors.primary.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(width: 10),

          // Imagen
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage(
              placeholder: const AssetImage('assets/loading.gif'),
              image: NetworkImage(category.image),
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          // Botón Ver productos
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsScreen(
                    categoryName: category.name,
                  ),
                ),
              );
            },
            child: const Text('Ver productos'),
          ),

          const SizedBox(height: 10),

          // Botón + info
          ElevatedButton(
            onPressed: () {
              final categoryProducts = allProducts
                  .where((product) => product.category == category.name)
                  .toList();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryScreen(
                    category: category,
                    products: categoryProducts,
                  ),
                ),
              );
            },
            child: const Text('+ Info'),
          ),
        ],
      ),
    );
  }
}
