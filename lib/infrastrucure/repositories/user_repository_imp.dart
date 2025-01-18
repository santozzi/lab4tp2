import 'package:flutter_application_base/domain/datasource/user/user_datasource.dart';
import 'package:flutter_application_base/domain/entities/user/user_entity.dart';
import 'package:flutter_application_base/domain/repositories/user/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserDatasource userDatasource;

  UserRepositoryImp({required this.userDatasource});

  @override
  Future<UserEntity> getUser(String id) async {
    return await userDatasource.getUser(id);
  }

  @override
  Future<List<UserEntity>> getUsers() async {
    return await userDatasource.getUsers();
  }

  @override
  Future<UserEntity> getUserByUsername(String username) async {
    return await userDatasource.getUserByUsername(username);
  }

  @override
  Future<String> login(String username, String password) async {
    return await userDatasource.login(username, password);
  }
}
