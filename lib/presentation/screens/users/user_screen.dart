import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';
import 'package:flutter_application_base/domain/entities/user_preferences.dart';
import 'package:flutter_application_base/infrastrucure/models/user_model.dart';
import 'package:flutter_application_base/presentation/providers/user_preferences_provider.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:flutter_application_base/presentation/widgets/user_card.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final UserEntity userSelected = args['user'];
    final UserPreferencesProvider userPreferenciesProvider =
        Provider.of<UserPreferencesProvider>(context);
    userPreferenciesProvider
        .setPreferencesByIdWithoutNotify(userSelected.id)
        .then((value) => log("Cargando provider..."));
    return Scaffold(
      backgroundColor: colors.primary,
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
            id: userSelected.id,
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
