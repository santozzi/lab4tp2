import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/themes/theme_theme.dart';

class RedTheme extends ThemeTheme {
  RedTheme();

  @override
  ThemeData getTheme(bool darkMode) {
    return ThemeData(
        colorSchemeSeed: Colors.red,
        brightness: (darkMode) ? Brightness.dark : Brightness.light,
        useMaterial3: true);
  }
}
