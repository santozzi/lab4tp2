import 'package:flutter/material.dart';
import 'package:flutter_application_base/presentation/screens/products/product_screen.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';

class ProductsCard extends StatelessWidget {
  final ProductsEntity product;

  const ProductsCard({super.key, required this.product});

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column (Title, Description, Price)
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.description.length > 25
                      ? '${product.description.substring(0, 25)}...'
                      : product.description,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 10),
                Text(
                  '\$ ${product.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Right Column (Image)
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  placeholder:
                      'assets/images/loading.gif', // Imagen que se muestra mientras carga.
                  image: product.images[0], // URL de la imagen.
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    // Imagen de error (por ejemplo, una local predeterminada).
                    return Image.asset(
                      'assets/images/image_not_found.jpg',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(
                        product: product,
                      ),
                    ),
                  );
                },
                child: const Text('Ver detalles'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
