import 'package:flutter/material.dart';

class UserCad extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  const UserCad({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.network(imageUrl), Text(title), Text(subtitle)],
    );
  }
}
