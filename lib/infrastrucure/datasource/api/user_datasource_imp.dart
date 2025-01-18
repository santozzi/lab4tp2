import 'dart:developer';

import 'package:flutter_application_base/config/env/connection_backend_config.dart';
import 'package:flutter_application_base/domain/datasource/user/user_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_base/domain/entities/user/user_entity.dart';
import 'package:flutter_application_base/domain/repositories/token_preferences_repository.dart';
import 'package:flutter_application_base/infrastrucure/datasource/user/shared_token_preferences_datasource_imp.dart';
import 'package:flutter_application_base/infrastrucure/models/user_model.dart';
import 'package:flutter_application_base/infrastrucure/repositories/token_repository_imp.dart';

class UserDatasoureceImp implements UserDatasource {
  final Dio dio = Dio(
    BaseOptions(
        baseUrl: ConnectionBackendConfig().init(),
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10)),
  );

  UserDatasoureceImp();

  @override
  Future<UserEntity> getUserByUsername(String username) {
    // TODO: implement getUserByUsername
    throw UnimplementedError();
  }

  @override
  Future<List<UserEntity>> getUsers() async {
    try {
      final TokenPreferencesRepository tokenPreferencesRepository =
          TokenRepositoryImp(
              tokenDatasource: SharedTokenPreferencesDatasourceImp());
      final token = await tokenPreferencesRepository.getTokenPreferences();
      final response = await dio.get('/users',
          options: Options(headers: {"Authorization": token}));
      final datos = await response.data;

      if (datos == null) {
        throw Exception("No se encontraron usuarios");
      }

      List<UserEntity> usuarios = [];
      for (var i = 0; i < datos.length; i++) {
        UserEntity usuario = UserModel.fromJson(datos[i]).toUserEntity();
        usuarios.add(usuario);
      }

      return usuarios;
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      final response = await dio.post(
        '/users/login/',
        data: {
          "username": username,
          "password": password,
        },
      );
      final datos = await response.data;
      log(datos.toString());

      if (datos != null) {
        return datos.toString();
      } else {
        return "";
      }
    } catch (e) {
      log(e.toString());
      throw Error();
    }
  }

  @override
  Future<UserEntity> getUser(String id) async {
    try {
      final TokenPreferencesRepository tokenPreferencesRepository =
          TokenRepositoryImp(
              tokenDatasource: SharedTokenPreferencesDatasourceImp());

      final token = await tokenPreferencesRepository.getTokenPreferences();
      final response = await dio.get("/users/$id",
          options: Options(headers: {"Authorization": token}));
      final dato = await response.data;

      if (dato != null) {
        UserEntity usuario = UserModel.fromJson(dato).toUserEntity();

        return usuario;
      } else {
        return UserEntity(
          id: "0",
          name: "",
          email: "",
          username: "",
          password: "",
          avatar: "",
          country: "",
          city: "",
          state: "",
          gender: "",
          phone: "",
          role: "",
        );
      }
    } catch (e) {
      log(e.toString());
      throw Error();
    }
  }
}
