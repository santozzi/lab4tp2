import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/entities/user_entity.dart';

import '../../domain/repositories/user_repository.dart';

class UsersProvider extends ChangeNotifier {
  final UserRepository usuarioRepository;
  List<UserEntity> users = [];
  UsersProvider({required this.usuarioRepository});

  Future<void> getUsers() async {
    users = await usuarioRepository.getUsers();
    notifyListeners();
  }

  //TODO terminar provider
}
