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
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(66, 13, 46, 235),
                    blurRadius: 1,
                    spreadRadius: 8,
                    offset: Offset(0, 0))
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(imageUrl, scale: 0.5)),
          ),
        ),
        Text(title),
        Text(subtitle)
      ],
    );
  }
}
