import 'package:flutter_application_base/domain/datasource/token_preferences_datasource.dart';
import 'package:flutter_application_base/domain/repositories/token_preferences_repository.dart';

class TokenRepositoryImp implements TokenPreferencesRepository {
  final TokenPreferencesDataSource tokenDatasource;

  TokenRepositoryImp({required this.tokenDatasource});

  @override
  Future<void> deleteTokenPreferences() {
    return tokenDatasource.deleteTokenPreferences();
  }

  @override
  Future<String> getTokenPreferences() {
    return tokenDatasource.getTokenPreferences();
  }

  @override
  Future<bool> isLogged() {
    return tokenDatasource.isLogged();
  }

  @override
  Future<void> setTokenPreferences(String token) {
    return tokenDatasource.setTokenPreferences(token);
  }
}
