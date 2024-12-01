import 'package:flutter/material.dart';
import 'package:flutter_application_base/presentation/screens/carts/cart_screen.dart';
// import 'package:flutter_application_base/presentation/providers/users_provider.dart';
// import 'package:flutter_application_base/domain/entities/user_entity.dart';
import 'package:flutter_application_base/domain/entities/carts_entity.dart';
// import 'package:provider/provider.dart';

class CartsCard extends StatelessWidget {
  final CartsEntity cart;

  const CartsCard({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // final userProvider = context.watch<UsersProvider>();

    // Obtenemos usuario del carrito
    // userProvider.getUser(cart.userId);
    // UserEntity cartUser;
    // cartUser = userProvider.user;

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
                      'Carrito: ${cart.id}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Usuario: ${cart.userId}',
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
                'Productos: ${cart.products.length}',
                 style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 10),
              Text(
                'Fecha: ${cart.date}',
                 style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(
                        cart: cart,
                      ),
                    ),
                  );
                },
                child: const Text('Ver Carrito'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}