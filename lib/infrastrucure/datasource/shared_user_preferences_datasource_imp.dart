import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application_base/domain/datasource/user_preferences_datasource.dart';
import 'package:flutter_application_base/domain/entities/user_preferences.dart';
import 'package:flutter_application_base/infrastrucure/models/user_list_preferences_model.dart';
import 'package:flutter_application_base/infrastrucure/models/user_preference_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedUserPreferencesDatasourceImp extends UserPreferencesDataSource {
  static final SharedUserPreferencesDatasourceImp _instance =
      SharedUserPreferencesDatasourceImp._internal();
  static String _preferences = 'entidades:[]';
  static String _logueado = '1019';

  SharedUserPreferencesDatasourceImp._internal();

  factory SharedUserPreferencesDatasourceImp() {
    return _instance;
  }
  @override
  Future<void> deleteUserPreferences(String id) async {
    List<UserPreferences> usersPreferences = await _usersPreferencestoList();
    usersPreferences.removeWhere((element) => element.userId == id);
    _usersPreferencesfromList(usersPreferences);
  }

  @override
  Future<UserPreferences> getUserPreferences(String id) async {
    List<UserPreferences> usersPreferences = await _usersPreferencestoList();

    UserPreferences userPreferences = usersPreferences
        .firstWhere((element) => element.userId == id, orElse: () {
      UserPreferences preferenceDefault =
          UserPreferences(isDarkMode: false, userId: id, theme: "blue");
      setUserPreferences(preferenceDefault);
      return preferenceDefault;
    });

    return userPreferences;
  }

  @override
  Future<void> setUserPreferences(UserPreferences userPreferences) async {
    List<UserPreferences> usersPreferences = await _usersPreferencestoList();
    usersPreferences
        .removeWhere((element) => element.userId == userPreferences.userId);
    usersPreferences.add(userPreferences);
    _usersPreferencesfromList(usersPreferences);
  }

  Future<String> getLogueado() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _logueado = prefs.getString('logueado') ?? '1019';
    return _logueado;
  }

  Future<List<UserPreferences>> _usersPreferencestoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _preferences = prefs.getString('usersPreferences') ??
        '{"entidades":[{"isDarkMode":false,"userId":"0","theme":"blue"}]}';

    List<UserPreferences> usersPreferencesToList = _preferences.isNotEmpty
        ? UserListPreferncesModel.fromJson(jsonDecode(_preferences))
            .toUserListPreferences()
        : [];

    return usersPreferencesToList;
  }

  Future<void> _usersPreferencesfromList(
      List<UserPreferences> usersPreferences) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'usersPreferences',
        jsonEncode(UserListPreferncesModel(
                userPreferenceModel: usersPreferences
                    .map((e) => UserPreferenceModel(
                          isDarkMode: e.isDarkMode,
                          userId: e.userId,
                          theme: e.theme,
                        ))
                    .toList())
            .toJson()));
  }
}
