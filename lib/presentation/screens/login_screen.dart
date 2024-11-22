import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/presentation/providers/user_preferences_provider.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';

import 'package:flutter_application_base/presentation/widgets/drawer_menu.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginScreen> {
  String _username = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    final UsersProvider userprovider = context.watch<UsersProvider>();
    final UserPreferencesProvider userPreferencesProvider =
        Provider.of<UserPreferencesProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          centerTitle: true,
          leadingWidth: 40,
          toolbarHeight: 80,
        ),
        drawer: DrawerMenu(),
        body: Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Image.asset(
                  'assets/images/logo.png',
                  scale: 0.5,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 50, left: 60, right: 60),
                child: (!userprovider.loged)
                    ? Column(
                        children: [
                          TextField(
                            onChanged: (value) {
                              _username = value;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            obscureText: true,
                            onChanged: (value) => _password = value,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              log('usuarios:   $_username, password: $_password');
                              final loged = await userprovider.login(
                                  _username, _password);
                              log('loged: $loged');
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          const Text('Bienvenido'),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              userprovider.logout();
                              await userPreferencesProvider.changeEntre();
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      ),
              )
            ],
          ),
        ));
  }
}
