import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';

import '../../domain/repositories/user_repository.dart';

class UsersProvider extends ChangeNotifier {
  final UserRepository usuarioRepository;
  int contador = 1;
  List<UserEntity> users = [];
  UserEntity user = UserEntity(
      id: '', name: '', email: '', role: '', avatar: '', password: '');
  UsersProvider({required this.usuarioRepository});

  Future<void> getUsers() async {
    users = await usuarioRepository.getUsers();

    notifyListeners();
  }

  Future<UserEntity> getUser(String id) async {
    user = await usuarioRepository.getUser(id);

    return user;
  }

  void incrementCounter() {
    contador++;
    notifyListeners();
  }
}
