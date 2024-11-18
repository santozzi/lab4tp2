import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  const UserCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(imageUrl)),
        Text(title),
        Text(subtitle)
      ],
    );
  }
}
