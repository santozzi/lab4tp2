import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/products_entity.dart';
import 'package:flutter_application_base/presentation/providers/products_provider.dart';
import 'package:flutter_application_base/presentation/widgets/products_card.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productprovider = context.watch<ProductsProvider>();
    productprovider.getProducts();
    final List<ProductsEntity> products = productprovider.products;
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductsCard(
                    imageUrl: products[index].images[0],
                    title: products[index].title,
                    price: products[index].price,
                    description: products[index].description);
              }),
        ),
      ),
    );
  }
}
