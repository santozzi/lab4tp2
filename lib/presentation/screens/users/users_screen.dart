import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:flutter_application_base/presentation/widgets/user_card.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    final UsersProvider userprovider = context.watch<UsersProvider>();

    userprovider.getUser(userprovider.contador).then((d) {
      log('Usuario cargado');
      log('${userprovider.users}');
    });
    final List<UserEntity> usuarios = userprovider.users;
    log('${usuarios.length} ');

    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
          //boton de regreso
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.builder(
          itemCount: usuarios.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(usuarios[index].avatar),
              title: Text(usuarios[index].name),
              subtitle: Text(usuarios[index].email),
            );
          },
        ),
      ),
    );
  }
}
