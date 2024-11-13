import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:flutter_application_base/presentation/widgets/user_card.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userprovider = context.watch<UsersProvider>();
    userprovider.getUser(3);
    final UserEntity usuario = userprovider.user;
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: UserCad(
              imageUrl: usuario.avatar,
              title: usuario.name,
              subtitle: usuario.email),
        ),
      ),
    );
  }
}
