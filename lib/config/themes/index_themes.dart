import 'package:flutter/material.dart';
import 'package:flutter_application_base/config/themes/themes.dart';
import 'package:flutter_application_base/domain/themes/theme_theme.dart';

Map<String, dynamic> themes = {
  'blue': (isDark) => BlueTheme().getTheme(isDark),
  'naranja': (isDark) => OrangeTheme().getTheme(isDark),
};

class IndexThemes extends ThemeTheme {
  final String theme;

  IndexThemes({required this.theme});

  @override
  ThemeData getTheme(bool darkMode) {
    if (themes[theme] == null) {
      return themes['blue']!(false);
    }

    return themes[theme]!(darkMode);
  }
}
