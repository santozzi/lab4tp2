import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';

import '../../domain/repositories/user_repository.dart';

class UsersProvider extends ChangeNotifier {
  final UserRepository usuarioRepository;
  late bool loged = false;

  late List<UserEntity> users = [];
  UserEntity user = UserEntity(
    id: '0',
    username: 'username',
    password: 'password',
    name: 'name',
    email: 'email',
    phone: 'phone',
    avatar: '',
    city: '',
    country: '',
    gender: '',
    role: '',
    state: '',
  );
  UsersProvider({required this.usuarioRepository});

  Future<void> getUsers() async {
    users = await usuarioRepository.getUsers();

    notifyListeners();
  }

  Future<UserEntity> getUser(String id) async {
    user = await usuarioRepository.getUser(id);
    return user;
  }

  Future<UserEntity> getUserByUsername(String username) async {
    user = await usuarioRepository.getUserByUsername(username);
    return user;
  }

  Future<bool> login(String username, String password) async {
    loged = await usuarioRepository.login(username, password);
    await getUserByUsername(username);
    notifyListeners();
    return loged;
  }

  void logout() {
    loged = false;
    notifyListeners();
  }
}
