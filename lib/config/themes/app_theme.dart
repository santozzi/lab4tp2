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

class AppTheme {
  final int selectedColor;
  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor < colors.length,
            "Te caiste del arreglo entre 0 y ${colors.length - 1} debe ser el valor");
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colors[selectedColor],
        brightness: Brightness.light);
  }
}
