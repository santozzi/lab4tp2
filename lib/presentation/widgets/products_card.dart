import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final String description;

  const ProductsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
        Text(title),
        Text('\$ $price'),
        Text("\$ $description"),
      ],
    );
  }
}
