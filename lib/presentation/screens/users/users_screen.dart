import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';

import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final UsersProvider userprovider = context.watch<UsersProvider>();

    userprovider.getUsers();

    final List<UserEntity> usuarios = userprovider.users;

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
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: usuarios.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: FadeInImage(
                    placeholder: const AssetImage('assets/loading.gif'),
                    image: NetworkImage(usuarios[index].avatar)),
              ),
              title: Text(usuarios[index].name),
              subtitle: Text(usuarios[index].email),
              onTap: () {
                userprovider.getUser(usuarios[index].id).then((user) {
                  Navigator.pushNamed(context, 'user',
                      arguments: <String, dynamic>{'user': user});
                });
              },
            );
          },
        ),
      ),
    );
  }
}
