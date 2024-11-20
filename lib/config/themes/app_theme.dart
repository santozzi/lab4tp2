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
Map<String, ThemeData> themes = {
  'blue': ThemeData(
      colorSchemeSeed: Colors.blue,
      brightness: Brightness.light,
      useMaterial3: true),
  'naranja': ThemeData(
      colorSchemeSeed: const Color(0xFFFFD54F),
      brightness: Brightness.light,
      useMaterial3: true),
  'Dark': ThemeData.dark(),
};

class AppTheme {
  final String theme;
  final bool darkMode;
  AppTheme({required this.theme, required this.darkMode});
  ThemeData getTheme() {
    if (themes[theme] == null) {
      return themes['blue']!;
    }
    if (darkMode) {
      return themes[theme]!.copyWith(
        brightness: Brightness.dark,
      );
    } else {
      return themes[theme]!;
    }
  }
}
