import 'package:flutter_application_base/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUser(String id);
  Future<List<UserEntity>> getUsers();
}
