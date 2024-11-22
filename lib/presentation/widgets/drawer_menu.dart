import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:provider/provider.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersProvider userProvider = context.watch<UsersProvider>();
    final List<Map<String, String>> menuItems = <Map<String, String>>[
      {'route': 'home', 'title': 'Home', 'subtitle': 'Home + counter app'},
      {
        'route': 'users',
        'title': 'Usuarios',
        'subtitle': 'Esta es la  pantalla de Sergio Antozzi'
      },
      {'route': 'custom_list', 'title': 'Custom list', 'subtitle': ''},
      {
        'route': 'products',
        'title': 'Listado de Productos',
        'subtitle': 'Gianluca el mejor'
      },
      {
        'route': 'login',
        'title': (userProvider.loged) ? 'LogOut' : 'Login',
        'subtitle': (userProvider.loged)
            ? 'Hola!!!, ${userProvider.user.name}'
            : 'Ingrese al sistema'
      },
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeaderAlternative(),
          ...ListTile.divideTiles(
              context: context,
              tiles: menuItems
                  .map((item) => ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        dense: true,
                        minLeadingWidth: 25,
                        iconColor: Colors.blueGrey,
                        title: Text(item['title']!,
                            style: const TextStyle(fontFamily: 'FuzzyBubbles')),
                        subtitle: Text(item['subtitle'] ?? '',
                            style: const TextStyle(
                                fontFamily: 'RobotoMono', fontSize: 11)),
                        leading: const Icon(Icons.arrow_right),
                        /* trailing: const Icon(Icons.arrow_right), */
                        onTap: () {
                          Navigator.pop(context);
                          //Navigator.pushReplacementNamed(context, item['route']!);
                          Navigator.pushNamed(context, item['route']!);
                        },
                      ))
                  .toList())
        ],
      ),
    );
  }
}

class _DrawerHeaderAlternative extends StatelessWidget {
  const _DrawerHeaderAlternative({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Stack(children: [
        Image.asset(
          'assets/images/title.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            '[  Menu  ]',
            style: TextStyle(
                fontSize: 13, color: Colors.black54, fontFamily: 'RobotoMono'),
            textAlign: TextAlign.right,
          ),
        ),
      ]),
    );
  }
}
