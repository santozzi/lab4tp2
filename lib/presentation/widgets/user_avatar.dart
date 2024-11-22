import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final ColorScheme colors;
  final String imageUrl;
  final double size;
  const UserAvatar(
      {super.key,
      required this.colors,
      required this.imageUrl,
      this.size = 200});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(500), boxShadow: [
        BoxShadow(
            color: colors.onPrimary.withOpacity(0.5),
            blurRadius: 1,
            spreadRadius: 8,
            offset: const Offset(0, 0))
      ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(500),
        child: Container(
          width: size,
          child: FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: (imageUrl != '')
                ? NetworkImage(imageUrl, scale: 0.50)
                : const AssetImage('assets/images/guest.png'),
          ),
        ),
      ),
    );
  }
}
