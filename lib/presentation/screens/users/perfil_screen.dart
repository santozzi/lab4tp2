import 'package:flutter/material.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:flutter_application_base/presentation/widgets/user_card.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersProvider usersProvider = Provider.of<UsersProvider>(context);
    final colors = Theme.of(context).colorScheme;
    final user = usersProvider.user;
    return Scaffold(
        backgroundColor: colors.primary,
        appBar: AppBar(
            title: const Text('Perfil'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Center(
            child: UserCard(
                id: user.id,
                imageUrl: user.avatar,
                phone: user.phone,
                email: user.email,
                name: user.name,
                country: user.country,
                city: user.city,
                state: user.state,
                gender: user.gender)));
  }
}
