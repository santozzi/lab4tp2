import 'package:flutter_application_base/domain/entities/user_preferences.dart';

abstract class UserPreferencesRepository {
  Future<UserPreferences> getUserPreferences(String id);
  Future<void> setUserPreferences(UserPreferences userPreferences);
  Future<void> deleteUserPreferences(String id);
  Future<String> getLogueado();
}
