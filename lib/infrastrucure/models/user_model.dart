import 'package:flutter_application_base/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String email;
  final String password;
  final String name;
  final String role;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']['value'],
      email: json['email'],
      password: json['login']['password'],
      name: '${json['name']['first']} ${json['name']['last']}',
      role: 'customer',
      avatar: json['picture']['large'],
    );
  }

  UserEntity toUserEntity() => UserEntity(
        id: id,
        email: email,
        password: password,
        name: name,
        role: role,
        avatar: avatar,
      );
}
