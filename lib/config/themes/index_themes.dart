import 'package:flutter/material.dart';
import 'package:flutter_application_base/config/themes/themes.dart';

Map<String, dynamic> themes = {
  'blue': (isDark) => BlueTheme(darkMode: isDark).getTheme(),
  'naranja': (isDark) => OrangeTheme(darkMode: isDark).getTheme(),
  'Dark': (isDark) => ThemeData.dark(),
};

class IndexThemes {
  final String theme;
  final bool darkMode;
  IndexThemes({required this.theme, required this.darkMode});

  ThemeData getTheme() {
    if (themes[theme] == null) {
      return themes['blue']!(false);
    }

    return themes[theme]!(darkMode);
  }
}
