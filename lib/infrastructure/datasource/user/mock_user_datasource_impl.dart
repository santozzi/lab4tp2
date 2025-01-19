import 'package:flutter_application_base/domain/datasource/user/user_datasource.dart';
import 'package:flutter_application_base/domain/entities/user/user_entity.dart';
import 'package:flutter_application_base/infrastructure/models/user_model.dart';
import 'package:flutter_application_base/mocks/users.mock.dart';

class MockUserDatasourceImpl implements UserDatasource {
  @override
  Future<UserEntity> getUser(String id) async {
    //simuación de peticion a la api
    //await Future.delayed(const Duration(seconds: 2));
    final usuarios = getUsers();
    final UserEntity usuario =
        (await usuarios).firstWhere((usuario) => usuario.id == id);

    return usuario;
  }

  @override
  Future<List<UserEntity>> getUsers() async {
    final List<UserEntity> usuarios =
        users.map((e) => UserModel.fromJson(e).toUserEntity()).toList();

    return usuarios;
  }

  @override
  Future<UserEntity> getUserByUsername(String username) async {
    final usuarios = getUsers();
    final UserEntity usuario = (await usuarios).firstWhere(
        (usuario) => usuario.username == username,
        orElse: () => UserEntity(
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
            role: ""));
    return usuario;
  }

  @override
  Future<String> login(String username, String password) async {
    UserEntity usuario = await getUserByUsername(username);
    if (usuario.id != "") {
      if (usuario.password == password) {
        return "true";
      }
    }
    return "false";
  }
}
