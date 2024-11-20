import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/config/themes/index_themes.dart';
import 'package:flutter_application_base/domain/entities/user_preferences.dart';
import 'package:flutter_application_base/presentation/providers/user_preferences_provider.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  final String imageUrl;
  final double fontS = 12;
  final String phone;
  final String email;
  final String name;
  final String country;
  final String city;
  final String state;
  final String gender;
  final String id;
  const UserCard(
      {super.key,
      required this.id,
      required this.imageUrl,
      required this.phone,
      required this.email,
      required this.name,
      required this.country,
      required this.city,
      required this.state,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final userPreferenciesProvider =
        Provider.of<UserPreferencesProvider>(context);
    final List<String> themes = IndexThemes.getThemes();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              boxShadow: [
                BoxShadow(
                    color: colors.onPrimary.withOpacity(0.5),
                    blurRadius: 1,
                    spreadRadius: 8,
                    offset: const Offset(0, 0))
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(imageUrl, scale: 0.50)),
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          child: Container(
            alignment: Alignment.center,
            height: 400,
            padding: const EdgeInsets.only(left: 50, right: 50),
            width: double.infinity,
            color: colors.primaryContainer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SwitchListTile.adaptive(
                    title: const Text('Dark Mode'),
                    value: userPreferenciesProvider.userPreferences.isDarkMode,
                    onChanged: (value) {
                      userPreferenciesProvider
                          .setTheme(UserPreferences(
                              isDarkMode: value,
                              userId: id,
                              theme: userPreferenciesProvider
                                  .userPreferences.theme))
                          .then((value) => log('value: $id'));
                    }),
                Row(
                  children: [
                    const Text('Theme: '),
                    DropdownButton(
                        value: userPreferenciesProvider.userPreferences.theme,
                        items: [
                          for (String theme in themes)
                            DropdownMenuItem(
                              value: theme,
                              child: Text(theme),
                            )
                        ],
                        onChanged: (value) async {
                          await userPreferenciesProvider.setTheme(
                              UserPreferences(
                                  isDarkMode: userPreferenciesProvider
                                      .userPreferences.isDarkMode,
                                  userId: id,
                                  theme: value.toString()));
                        }),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: name, prefixIcon: const Icon(Icons.person)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: email, prefixIcon: const Icon(Icons.email)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: phone, prefixIcon: const Icon(Icons.phone)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: '$country - $state - $city',
                      prefixIcon: const Icon(Icons.location_city)),
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: gender, prefixIcon: const Icon(Icons.wc)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
