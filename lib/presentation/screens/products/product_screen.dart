import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/cart/product_cart_entity.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/presentation/providers/carts_provider.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:flutter_application_base/presentation/widgets/cart_icon.dart';
import 'package:flutter_application_base/presentation/widgets/drawer_menu.dart';
import 'package:flutter_application_base/presentation/widgets/image_carousel.dart';
import 'package:provider/provider.dart'; // Importa el widget reutilizable

class ProductScreen extends StatelessWidget {
  final ProductEntity product;

  const ProductScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final cartprovider = context.watch<CartsProvider>();
    final userProvider = context.watch<UsersProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: colors.primary,
        actions: [
          (userProvider.loged)
              ? CartIcon(number: cartprovider.quantity)
              : const SizedBox(),
        ],
      ),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                product.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Uso del widget reutilizable
            ImageCarousel(images: product.images),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${product.price}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      (userProvider.loged)
                          ? ElevatedButton(
                              onPressed: () async {
                                await cartprovider.addProduct(
                                  ProductCartEntity(
                                    productId: product.id,
                                    quantity: 1,
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Agregado al carrito: ${product.title}'),
                                  ),
                                );
                              },
                              child: const Text('Agregar al carrito'),
                            )
                          : const Text('Inicia sesión para comprar'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Categoría: ${product.category}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
