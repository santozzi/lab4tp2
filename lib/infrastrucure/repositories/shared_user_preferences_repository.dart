import 'package:flutter_application_base/domain/datasource/user_preferences_datasource.dart';
import 'package:flutter_application_base/domain/entities/user_preferences.dart';
import 'package:flutter_application_base/domain/repositories/user_preferences_repositoriy.dart';

class SharedUserPreferencesRepository extends UserPreferencesRepository {
  final UserPreferencesDataSource userPreferencesDataSource;

  SharedUserPreferencesRepository({required this.userPreferencesDataSource});

  @override
  Future<void> deleteUserPreferences(String id) async {
    await userPreferencesDataSource.deleteUserPreferences(id);
  }

  @override
  Future<UserPreferences> getUserPreferences(String id) async {
    return await userPreferencesDataSource.getUserPreferences(id);
  }

  @override
  Future<void> setUserPreferences(UserPreferences userPreferences) async {
    await userPreferencesDataSource.setUserPreferences(userPreferences);
  }

  @override
  Future<String> getLogueado() async {
    return await userPreferencesDataSource.getLogueado();
  }
}
