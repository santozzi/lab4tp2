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
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(50),
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: FadeInImage(
              placeholder: const AssetImage('assets/loading.gif'),
              image: NetworkImage(imageUrl),
            ),
          ),
          Text(title),
          Text('\$ $price'),
          Text(
            "\$ ${(description.length >= 100) ? '${description.substring(0, 100)}...' : description}",
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}