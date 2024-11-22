import 'package:flutter_application_base/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String email;
  final String username;
  final String password;
  final String name;
  final String role;
  final String avatar;
  final String gender;
  final String country;
  final String city;
  final String state;
  final String phone;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.gender,
    required this.country,
    required this.city,
    required this.state,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']['value'],
      email: json['email'],
      username: json['login']['username'],
      password: json['login']['password'],
      name: '${json['name']['first']} ${json['name']['last']}',
      role: 'customer',
      avatar: json['picture']['large'],
      gender: json['gender'],
      country: json['location']['country'],
      city: json['location']['city'],
      state: json['location']['state'],
      phone: json['phone'],
    );
  }

  UserEntity toUserEntity() => UserEntity(
      id: id,
      email: email,
      username: username,
      password: password,
      name: name,
      role: role,
      avatar: avatar,
      gender: gender,
      country: country,
      city: city,
      state: state,
      phone: phone);
}
