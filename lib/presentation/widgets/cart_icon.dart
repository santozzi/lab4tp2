import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  int number;
  CartIcon({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar a la pantalla del carrito
        Navigator.pushNamed(context, 'carts');
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Icono del carrito
            const Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            // Número de productos
            Positioned(
                right: 0,
                top: 5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$number',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
