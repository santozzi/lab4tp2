import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/carts_entity.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';
import 'package:flutter_application_base/presentation/providers/products_provider.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:flutter_application_base/presentation/widgets/products_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  final CartsEntity cart;

  const CartScreen({
    super.key,
    required this.cart,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final productProvider = context.watch<ProductsProvider>();
    final userProvider = context.watch<UsersProvider>();

    // Llamamos a getProducts solo si la lista de productos está vacía
    if (productProvider.products.isEmpty) {
      productProvider.getProducts(); // Obtener productos si no están cargados.
    }
    // Filtramos los productos por el ID de los productos en el carrito.
    List<ProductsEntity> cartProducts;
    cartProducts = productProvider.getProductsByCart(cart);

    // Obtenemos usuario del carrito
    userProvider.getUser(cart.userId.toString());
    UserEntity cartUser;
    cartUser = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        backgroundColor: colors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Usuario: ${cartUser.name}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            Text(
              'Carrito: ${cart.id}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Cantidad de productos
            Text(
              'Productos: ${cartProducts.isEmpty ? 0 : cartProducts.length}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: cartProducts.isEmpty
               ? const Text(
                 'No se encontraron productos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
                : ListView.builder(
                  itemCount: cartProducts.length,
                  itemBuilder: (context, index) {
                  return ProductsCard(product: cartProducts[index]);
                  },
                ),
            ),

            // Boton
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ProductsScreen(
            //           categoryName: category
            //               .name, // Pasamos solo el nombre de la categoría.
            //         ),
            //       ),
            //     );
            //   },
            //   child: const Text('Ver productos'),
            // ),
          ],
        ),
      ),
    );
  }
}
