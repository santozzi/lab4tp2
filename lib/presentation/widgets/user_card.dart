import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String imageUrl;

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        Container(
          alignment: Alignment.center,
          height: 500,
          width: double.infinity,
          color: Colors.grey[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(Icons.person),
                  Text(name),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.email),
                  Text(email),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.phone),
                  Text(phone),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_city),
                  Text('$country - $state - $city'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.wc),
                  Text(gender),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
