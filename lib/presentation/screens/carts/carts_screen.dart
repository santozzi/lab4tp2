import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/carts_entity.dart';
import 'package:flutter_application_base/presentation/providers/carts_provider.dart';
import 'package:flutter_application_base/presentation/widgets/carts_card.dart';
import 'package:provider/provider.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartprovider = context.watch<CartsProvider>();
    final colors = Theme.of(context).colorScheme;
    cartprovider.getCarts();
    final List<CartsEntity> carts = cartprovider.carts;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Carritos'),
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
              itemCount: carts.length,
              itemBuilder: (context, index) {
                return CartsCard(cart: carts[index]);
              }),
        ),
      );
  }
}
