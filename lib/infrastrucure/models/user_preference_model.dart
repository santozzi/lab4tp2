class UserPreferenceModel {
  final bool isDarkMode;
  final String userId;
  final String theme;

  UserPreferenceModel({
    required this.isDarkMode,
    required this.userId,
    required this.theme,
  });

  // Método para convertir la entidad a un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'isDarkMode': isDarkMode,
      'theme': theme,
    };
  }

  // Método para construir la entidad desde un mapa JSON
  factory UserPreferenceModel.fromJson(Map<String, dynamic> json) {
    return UserPreferenceModel(
      userId: json['userId'],
      isDarkMode: json['isDarkMode'],
      theme: json['theme'],
    );
  }
}
