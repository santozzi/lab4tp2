abstract class TokenPreferencesDataSource {
  Future<String> getTokenPreferences();
  Future<void> setTokenPreferences(String token);
  Future<void> deleteTokenPreferences();
  Future<bool> isLogged();
}
