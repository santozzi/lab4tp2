import 'package:flutter_application_base/domain/datasource/user_datasource.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';
import 'package:flutter_application_base/domain/repositories/user_repository.dart';

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
}
