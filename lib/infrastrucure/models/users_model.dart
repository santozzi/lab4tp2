import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';

class UsersModel {
  final int id;
  final String email;
  final String password;
  final String name;
  final String role;
  final String avatar;
  final DateTime creationAt;
  final DateTime updatedAt;

  UsersModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
    required this.creationAt,
    required this.updatedAt,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      role: json['role'],
      avatar: json['avatar'],
      creationAt: DateTime.parse(json['creationAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  UserEntity toUserEntity() => UserEntity(
      id: id,
      email: email,
      password: password,
      name: name,
      role: role,
      avatar: avatar,
      creationAt: creationAt,
      updatedAt: updatedAt);
}
