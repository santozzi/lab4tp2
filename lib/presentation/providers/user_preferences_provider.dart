import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user_preferences.dart';
import 'package:flutter_application_base/domain/repositories/user_preferences_repositoriy.dart';

class UserPreferencesProvider extends ChangeNotifier {
  final UserPreferencesRepository userPreferencesRepository;
  bool isDarkMode = false;
  bool entre = false;
  UserPreferences userPreferences = UserPreferences(
    userId: '0',
    theme: 'blue',
    isDarkMode: false,
  );

  UserPreferencesProvider({required this.userPreferencesRepository});

  Future<void> getTheme(String id) async {
    userPreferences = await userPreferencesRepository.getUserPreferences(id);
    notifyListeners();
  }

  Future<void> getTheme2(String id) async {
    userPreferences = await userPreferencesRepository.getUserPreferences(id);
  }

  Future<void> setTheme(UserPreferences userPreferences) async {
    await userPreferencesRepository.setUserPreferences(userPreferences);
    this.userPreferences = userPreferences;
    notifyListeners();
  }

  UserPreferences getPreferences() {
    return userPreferences;
  }

  void changeMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
