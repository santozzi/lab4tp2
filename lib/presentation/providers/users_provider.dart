import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user/user_entity.dart';
import 'package:flutter_application_base/domain/repositories/token_preferences_repository.dart';
import 'package:flutter_application_base/infrastructure/datasource/user/shared_token_preferences_datasource_imp.dart';
import 'package:flutter_application_base/infrastructure/repositories/token_repository_imp.dart';
import '../../domain/repositories/user/user_repository.dart';

UserEntity userDefault = UserEntity(
  id: "0",
  username: 'username',
  password: 'password',
  name: 'name',
  email: 'email',
  phone: 'phone',
  avatar: '',
  city: '',
  country: '',
  gender: '',
  role: '',
  state: '',
);

class UsersProvider extends ChangeNotifier {
  final UserRepository usuarioRepository;
  late bool loged = false;

  late List<UserEntity> users = [];
  UserEntity user = userDefault;
  UsersProvider({required this.usuarioRepository});

  Future<List<UserEntity>> getUsers() async {
    try {
      users = await usuarioRepository.getUsers();
      return users;
    } catch (e) {
      log("en getUsers provider: ${e.toString()}");
      return [];
    }

    //notifyListeners();
  }

  Future<UserEntity> getUser(String id) async {
    user = await usuarioRepository.getUser(id);
    notifyListeners();
    return user;
  }

  Future<UserEntity> getUserByUsername(String username) async {
    user = await usuarioRepository.getUserByUsername(username);
    return user;
  }

  Future<UserEntity> login(String username, String password) async {
    final TokenPreferencesRepository tokenPreferencesRepository =
        TokenRepositoryImp(
            tokenDatasource: SharedTokenPreferencesDatasourceImp());

    final token = await usuarioRepository.login(username, password);
    // await getUserByUsername(username);

    final jwt = JWT.decode(token);
    final payload = jwt.payload;
    await tokenPreferencesRepository.setTokenPreferences(token);

    user = await usuarioRepository.getUser("${payload["id"]}");

    loged = token != "";
    notifyListeners();
    return user;
  }

  Future<UserEntity> isLogged() async {
    final TokenPreferencesRepository tokenPreferencesRepository =
        TokenRepositoryImp(
            tokenDatasource: SharedTokenPreferencesDatasourceImp());
    final token = await tokenPreferencesRepository.getTokenPreferences();

    if (token != "") {
      final jwt = JWT.decode(token);
      final payload = jwt.payload;

      user = await usuarioRepository.getUser("${payload["id"]}");
      loged = true;
    }
    //notifyListeners();

    return user;
  }

  Future<void> logout() async {
    loged = false;
    user = userDefault;
    final TokenPreferencesRepository tokenPreferencesRepository =
        TokenRepositoryImp(
            tokenDatasource: SharedTokenPreferencesDatasourceImp());
    await tokenPreferencesRepository.deleteTokenPreferences();
    notifyListeners();
  }
}
