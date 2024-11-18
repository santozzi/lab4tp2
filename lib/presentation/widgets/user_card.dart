import 'package:flutter/material.dart';

class UserCad extends StatefulWidget {
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
  State<UserCad> createState() => _UserCadState();
}

class _UserCadState extends State<UserCad> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(widget.imageUrl)),
        Text(widget.title),
        Text(widget.subtitle)
      ],
    );
  }
}
