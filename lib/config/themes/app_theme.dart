import 'dart:developer';

import 'package:flutter/material.dart';

const List<Color> colors = [
  Color(0xFFE57373),
  Color(0xFFBA68C8),
  Color(0xFF64B5F6),
  Color(0xFF4DB6AC),
  Color(0xFF81C784),
  Color(0xFFFFD54F),
  Color(0xFFFF8A65),
  Color(0xFF90A4AE),
  Color(0xFFA1887F),
  Color(0xFF9575CD),
];
Map<String, dynamic> themes = {
  'blue': (isDark) => ThemeData(
      colorSchemeSeed: Colors.blue,
      brightness: (isDark) ? Brightness.dark : Brightness.light,
      useMaterial3: true),
  'naranja': (isDark) => ThemeData(
          colorSchemeSeed: const Color(0xFFFFD54F),
          brightness: (isDark) ? Brightness.dark : Brightness.light,
          useMaterial3: true)
      .copyWith(brightness: (isDark) ? Brightness.dark : Brightness.light),
  'Dark': (isDark) => ThemeData.dark(),
};

class AppTheme {
  final String theme;
  final bool darkMode;
  AppTheme({required this.theme, required this.darkMode});

  ThemeData getTheme() {
    log('dede el theme: $darkMode');
    if (themes[theme] == null) {
      return themes['blue']!(false);
    }

    return themes[theme]!(darkMode);
  }
}
