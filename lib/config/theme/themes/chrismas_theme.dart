import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/themes/theme_theme.dart';

class ChrismasTheme extends ThemeTheme {
  static const Color primaryDark = Color(0xffFE1310);
  static const Color secondary = Colors.grey;
  static const Color formElementsColor = Colors.green;
  static final Color primaryHover = Colors.red.shade600;
  ChrismasTheme();

  @override
  ThemeData getTheme(bool darkMode) {
    if (darkMode) {
      return ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 199, 83, 83),
        colorScheme: const ColorScheme(
            primary: Color(0xff680404),
            primaryContainer: Color.fromARGB(255, 6, 31, 0),
            secondary: secondary,
            surface: Color(0xff092F00),
            // background: Colors.white,
            error: Colors.red,
            onPrimary: Colors.red,
            onSecondary: Color.fromARGB(255, 43, 25, 25),
            onSurface: Color(0xffE1E0E6),
            onError: Colors.white,
            brightness: Brightness.light),
      );
    }
    return ThemeData(
      //scaffoldBackgroundColor: const Color.fromARGB(255, 199, 83, 83),
      colorScheme: const ColorScheme(
          primary: primaryDark,
          primaryContainer: Color(0xffE1E0E6),
          secondary: secondary,
          surface: Color(0xffE1E0E6),
          // background: Colors.white,
          error: Colors.red,
          onPrimary: Color(0xff092F00),
          onSecondary: Color.fromARGB(255, 43, 25, 25),
          onSurface: Color(0xff092F00),
          onError: Colors.white,
          brightness: Brightness.light),
    );
  }
}
