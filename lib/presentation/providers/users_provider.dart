import 'package:flutter/material.dart';

import '../../domain/repositories/user_repository.dart';

class UsersProvider extends ChangeNotifier {
  final UserRepository usuarioRepository;

  UsersProvider({required this.usuarioRepository});
  //TODO terminar provider
}
