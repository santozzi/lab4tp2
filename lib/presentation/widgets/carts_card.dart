import 'package:flutter/material.dart';
// import 'package:flutter_application_base/presentation/screens/carts/carts_screen.dart';
import 'package:flutter_application_base/domain/entities/carts_entity.dart';

class CartsCard extends StatelessWidget {
  final CartsEntity cart;

  const CartsCard({super.key, required this.cart});

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
          // Left Column (Id, UserId)
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Id: ${cart.id}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 10),
                Text(
                  'User Id: ${cart.userId}',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(width: 10),
          // Right Column (Products.lenght, Date)
          Column(
            children: [
              Text(
                'Products: ${cart.products.length}',
                 style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 10),
              Text(
                'Date: ${cart.date}',
                 style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 10),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => ProductScreen(
              //           product: product,
              //         ),
              //       ),
              //     );
              //   },
              //   child: const Text('Ver detalles'),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
