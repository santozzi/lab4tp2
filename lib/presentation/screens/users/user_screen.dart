import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';
import 'package:flutter_application_base/infrastrucure/models/user_model.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:flutter_application_base/presentation/widgets/user_card.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final UserEntity userSelected = args['user'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
        //boton de regreso
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: UserCard(
            imageUrl: userSelected.avatar,
            name: userSelected.name,
            email: userSelected.email,
            phone: userSelected.phone,
            country: userSelected.country,
            city: userSelected.city,
            state: userSelected.state,
            gender: userSelected.gender),
      ),
    );
  }
}