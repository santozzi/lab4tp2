import 'package:flutter/material.dart';

import 'package:flutter_application_base/presentation/widgets/drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _username = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'products');
                      },
                      child: const Text('Buscar productos'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
