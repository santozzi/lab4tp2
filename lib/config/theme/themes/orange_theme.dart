import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/themes/theme_theme.dart';

class OrangeTheme extends ThemeTheme {
  OrangeTheme();

  @override
  ThemeData getTheme(bool darkMode) {
    return ThemeData(
        colorSchemeSeed: const Color(0xFFFFD54F),
        brightness: (darkMode) ? Brightness.dark : Brightness.light,
        useMaterial3: true);
  }
}
