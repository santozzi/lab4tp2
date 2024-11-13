import 'package:flutter_application_base/domain/datasource/user_datasource.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';
import 'package:flutter_application_base/infrastrucure/models/user_model.dart';
import 'package:flutter_application_base/mocks/users.mock.dart';

class MockUserDatasourceImpl implements UserDatasource {
  @override
  Future<UserEntity> getUser(int id) async {
    //simuación de peticion a la api
    await Future.delayed(const Duration(seconds: 2));
    final usuarios = getUsers();
    final UserEntity usuario =
        (await usuarios).firstWhere((usuario) => usuario.id == id);
    return usuario;
  }

  @override
  Future<List<UserEntity>> getUsers() async {
    //simuación de peticion a la api
    await Future.delayed(const Duration(seconds: 2));
    final List<UserEntity> usuarios = users
        .map((usuario) => UserModel.fromJson(usuario).toUserEntity())
        .toList();

    return usuarios;
  }
}
