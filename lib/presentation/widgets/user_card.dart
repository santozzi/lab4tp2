import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String imageUrl;
  final double fontS = 12;
  final String phone;
  final String email;
  final String name;
  final String country;
  final String city;
  final String state;
  final String gender;
  const UserCard(
      {super.key,
      required this.imageUrl,
      required this.phone,
      required this.email,
      required this.name,
      required this.country,
      required this.city,
      required this.state,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              boxShadow: [
                BoxShadow(
                    color: colors.onPrimary.withOpacity(0.5),
                    blurRadius: 1,
                    spreadRadius: 8,
                    offset: const Offset(0, 0))
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(imageUrl, scale: 0.45)),
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          child: Container(
            alignment: Alignment.center,
            height: 400,
            padding: const EdgeInsets.only(left: 50, right: 50),
            width: double.infinity,
            color: colors.primaryContainer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextField(
                  decoration: InputDecoration(
                      hintText: name,
                      hintStyle: TextStyle(color: colors.onPrimaryFixed),
                      prefixIcon: const Icon(Icons.person)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: email,
                      hintStyle: TextStyle(color: colors.onPrimaryFixed),
                      prefixIcon: const Icon(Icons.email)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: phone,
                      hintStyle: TextStyle(color: colors.onPrimaryFixed),
                      prefixIcon: const Icon(Icons.phone)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: '$country - $state - $city',
                      hintStyle: TextStyle(color: colors.onPrimaryFixed),
                      prefixIcon: const Icon(Icons.location_city)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: gender,
                      hintStyle: TextStyle(color: colors.onPrimaryFixed),
                      prefixIcon: const Icon(Icons.wc)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
