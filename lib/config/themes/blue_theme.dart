import 'package:flutter/material.dart';

class BlueTheme {
  final bool darkMode;
  BlueTheme({required this.darkMode});

  ThemeData getTheme() {
    return ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: (darkMode) ? Brightness.dark : Brightness.light,
        useMaterial3: true);
  }
}
