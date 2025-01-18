abstract class TokenPreferencesRepository {
  Future<String> getTokenPreferences();
  Future<void> setTokenPreferences(String token);
  Future<void> deleteTokenPreferences();
  Future<bool> isLogged();
}
