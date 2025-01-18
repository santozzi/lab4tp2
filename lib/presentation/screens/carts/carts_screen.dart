import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';
import 'package:flutter_application_base/domain/entities/product_cart_entity.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/presentation/providers/carts_provider.dart';
import 'package:flutter_application_base/presentation/providers/products_provider.dart';
import 'package:flutter_application_base/presentation/widgets/cart_card.dart';
import 'package:flutter_application_base/presentation/widgets/carts_card.dart';
import 'package:flutter_application_base/presentation/widgets/products_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartprovider = context.watch<CartsProvider>();

    late Future<List<ProductCartQEntity>> cartProducts =
        cartprovider.getProducts();

    final colors = Theme.of(context).colorScheme;
    //cartprovider.getCarts();
    //final List<CartEntity> carts = cartprovider.carts;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        backgroundColor: colors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<ProductCartQEntity>>(
        future: cartProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return Center(
              child: Expanded(
                child: snapshot.data!.isEmpty
                    ? const Text(
                        'No se encontraron productos',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    : Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return CartCard(
                                    productCart: snapshot.data![index]);
                              },
                            ),
                          ),
                          Text("Total: \$ ${cartprovider.total}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                        ],
                      ),
              ),
            );
          } else {
            return const Center(
              child: Text(
                'Error al cargar los productos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }
        },
      ),
    );
  }
}
