import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user/user_entity.dart';
import 'package:flutter_application_base/domain/entities/user/user_preferences.dart';
import 'package:flutter_application_base/infrastrucure/datasource/user/shared_user_preferences_datasource_imp.dart';
import 'package:flutter_application_base/infrastrucure/repositories/shared_user_preferences_repository.dart';
import 'package:flutter_application_base/presentation/providers/user_preferences_provider.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';

import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final UsersProvider userprovider = context.watch<UsersProvider>();
    final UserPreferencesProvider userPreferenciesProvider =
        context.watch<UserPreferencesProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
        //boton de regreso
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<UserEntity>>(
        future: userprovider.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue, // Color principal del indicador
                backgroundColor: Colors.grey[300], // Color del fondo
                strokeWidth: 6.0, // Grosor del indicador
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: FadeInImage(
                          placeholder: const AssetImage('assets/loading.gif'),
                          imageErrorBuilder: (context, error, stackTrace) =>
                              const Image(
                                  image: AssetImage(
                                      'assets/images/avatar_not_found.png')),
                          image: NetworkImage(snapshot.data![index].avatar)),
                    ),
                    title: Text(snapshot.data![index].name),
                    subtitle: Text(snapshot.data![index].email),
                    onTap: () {
                      userprovider
                          .getUser(snapshot.data![index].id)
                          .then((user) {
                        Navigator.pushNamed(context, 'user',
                            arguments: <String, dynamic>{'user': user});
                      });
                    },
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
