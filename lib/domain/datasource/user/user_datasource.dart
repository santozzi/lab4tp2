import 'package:flutter_application_base/domain/entities/user/user_entity.dart';

abstract class UserDatasource {
  Future<UserEntity> getUser(String id);
  Future<List<UserEntity>> getUsers();
  Future<UserEntity> getUserByUsername(String username);
  Future<String> login(String username, String password);
}
