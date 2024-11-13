import 'package:flutter_application_base/domain/datasource/user_datasource.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';

class MockUserDatasourceImpl implements UserDatasource {
  @override
  Future<UserEntity> getUser(int id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserEntity>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
