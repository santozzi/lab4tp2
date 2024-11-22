import 'package:flutter_application_base/domain/entities/user_entity.dart';

abstract class UserDatasource {
  Future<UserEntity> getUser(String id);
  Future<List<UserEntity>> getUsers();
  Future<UserEntity> getUserByUsername(String username);
  Future<bool> login(String username, String password);
}
