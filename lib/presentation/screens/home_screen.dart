import 'package:flutter/material.dart';
import 'package:flutter_application_base/presentation/providers/carts_provider.dart';
import 'package:flutter_application_base/presentation/providers/user_preferences_provider.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:flutter_application_base/presentation/widgets/drawer_menu.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final UserPreferencesProvider userPreferencesProvider =
        Provider.of<UserPreferencesProvider>(context);
    final UsersProvider usersProvider = Provider.of<UsersProvider>(context);
    final cartprovider = context.watch<CartsProvider>();
    if (!userPreferencesProvider.entre) {
      usersProvider.isLogged().then((value) async {
        final userId = usersProvider.user.id;
        await cartprovider.getCart(userId);
        cartprovider.getQuantity();
        userPreferencesProvider
            .setPreferencesByIdWithoutNotify(userId)
            .then((c) {
          userPreferencesProvider.notificar();
          userPreferencesProvider.entre = true;
        });
      });
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
          centerTitle: true,
          leadingWidth: 40,
          toolbarHeight: 80,
        ),
        drawer: const DrawerMenu(),
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
                        cartprovider.getQuantity();
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
