import 'package:flutter/material.dart';
import 'package:flutter_application_base/presentation/screens/cart/cart_screen.dart';
// import 'package:flutter_application_base/presentation/providers/users_provider.dart';
// import 'package:flutter_application_base/domain/entities/user_entity.dart';
import 'package:flutter_application_base/domain/entities/cart/cart_entity.dart';
// import 'package:provider/provider.dart';

class CartsCard extends StatelessWidget {
  final CartEntity cart;

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
                child: CartScreen(
                  cart: cart,
                )),
          ],
        ));
  }
}
