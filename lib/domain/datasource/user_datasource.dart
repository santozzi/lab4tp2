import 'package:flutter_application_base/domain/entities/user_entity.dart';

abstract class UserDatasource {
  Future<UserEntity> getUser(int id);
  Future<List<UserEntity>> getUsers();
}
