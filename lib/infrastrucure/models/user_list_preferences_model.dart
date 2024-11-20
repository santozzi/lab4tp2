import 'package:flutter_application_base/domain/entities/user_preferences.dart';
import 'package:flutter_application_base/infrastrucure/models/user_preference_model.dart';

class UserListPreferncesModel {
  final List<UserPreferenceModel> userPreferenceModel;

  UserListPreferncesModel({required this.userPreferenceModel});

  // Convertir la lista de entidades a JSON
  Map<String, dynamic> toJson() {
    return {
      'entidades': userPreferenceModel.map((e) => e.toJson()).toList(),
    };
  }

  // Crear una lista de entidades desde JSON
  factory UserListPreferncesModel.fromJson(Map<String, dynamic> json) {
    return UserListPreferncesModel(
      userPreferenceModel: (json['entidades'] as List)
          .map((e) => UserPreferenceModel.fromJson(e))
          .toList(),
    );
  }
  List<UserPreferences> toUserListPreferences() {
    return userPreferenceModel
        .map((e) => UserPreferences(
              isDarkMode: e.isDarkMode,
              userId: e.userId,
              theme: e.theme,
            ))
        .toList();
  }
}
