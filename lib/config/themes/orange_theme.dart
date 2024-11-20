import 'package:flutter/material.dart';

class OrangeTheme {
  final bool darkMode;
  OrangeTheme({required this.darkMode});

  ThemeData getTheme() {
    return ThemeData(
        colorSchemeSeed: const Color(0xFFFFD54F),
        brightness: (darkMode) ? Brightness.dark : Brightness.light,
        useMaterial3: true);
  }
}
