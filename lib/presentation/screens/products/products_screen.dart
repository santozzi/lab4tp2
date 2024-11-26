import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/presentation/providers/products_provider.dart';
import 'package:flutter_application_base/presentation/widgets/products_card.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productprovider = context.watch<ProductsProvider>();
    final colors = Theme.of(context).colorScheme;
    productprovider.getProducts();
    final List<ProductsEntity> products = productprovider.products;
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
          child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductsCard(product: products[index]);
              }),
        ),
      );
  }
}
