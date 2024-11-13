import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';

import '../../domain/repositories/user_repository.dart';

class UsersProvider extends ChangeNotifier {
  final UserRepository usuarioRepository;
  List<UserEntity> users = [];
  UserEntity user = UserEntity(
      id: 0,
      name: '',
      email: '',
      role: '',
      avatar: '',
      creationAt: DateTime.now(),
      updatedAt: DateTime.now(),
      password: '');
  UsersProvider({required this.usuarioRepository});

  Future<void> getUsers() async {
    users = await usuarioRepository.getUsers();
    notifyListeners();
  }

  Future<void> getUser(int id) async {
    await usuarioRepository.getUser(id);
    notifyListeners();
  }

  //TODO terminar provider
}
