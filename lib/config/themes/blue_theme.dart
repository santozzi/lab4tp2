import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/themes/theme_theme.dart';

class BlueTheme extends ThemeTheme {
  BlueTheme();

  @override
  ThemeData getTheme(bool darkMode) {
    return ThemeData(
        colorSchemeSeed: Colors.blue,
        brightness: (darkMode) ? Brightness.dark : Brightness.light,
        useMaterial3: true);
  }
}
