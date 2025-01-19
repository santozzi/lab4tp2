import 'package:flutter/material.dart';
import 'package:flutter_application_base/presentation/providers/carts_provider.dart';
import 'package:flutter_application_base/presentation/providers/products_provider.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:flutter_application_base/presentation/widgets/cart_icon.dart';
import 'package:flutter_application_base/presentation/widgets/drawer_menu.dart';
import 'package:flutter_application_base/presentation/widgets/products_card.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  final String categoryName;

  const ProductsScreen({super.key, this.categoryName = ""});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String searchQuery = ''; // Estado para la búsqueda

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductsProvider>();
    final cartprovider = context.watch<CartsProvider>();

    final userProvider = context.watch<UsersProvider>();
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchQuery = value; // Actualizar el término de búsqueda
            });
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            hintText: 'Buscar productos...',
            hintStyle: const TextStyle(color: Colors.white70),
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search,
                color: Colors.white70), // Ícono de lupa
            suffixIcon: searchQuery.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        searchQuery = ''; // Limpiar la búsqueda
                      });
                    },
                  )
                : null, // Mostrar el botón solo si hay texto
          ),
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
        ),
        backgroundColor: colors.primary,
        actions: [
          (userProvider.loged)
              ? CartIcon(number: cartprovider.quantity)
              : const SizedBox(),
        ],
      ),
      drawer: const DrawerMenu(),
      body: FutureBuilder(
        future: productProvider.getFilteredProducts(
            widget.categoryName, searchQuery),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue, // Color principal del indicador
                backgroundColor: Colors.grey[300], // Color del fondo
                strokeWidth: 6.0, // Grosor del indicador
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: snapshot.data!.isEmpty
                  ? const Text(
                      'No se encontraron productos',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ProductsCard(product: snapshot.data![index]);
                      },
                    ),
            );
          }
        },
      ),
    );
  }
}
