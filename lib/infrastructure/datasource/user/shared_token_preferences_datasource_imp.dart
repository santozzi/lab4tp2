import 'package:flutter_application_base/domain/datasource/token_preferences_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedTokenPreferencesDatasourceImp extends TokenPreferencesDataSource {
  static final SharedTokenPreferencesDatasourceImp _instance =
      SharedTokenPreferencesDatasourceImp._internal();

  //Patron de diseño Singleton
  SharedTokenPreferencesDatasourceImp._internal();

  factory SharedTokenPreferencesDatasourceImp() {
    return _instance;
  }
  @override
  Future<void> deleteTokenPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('tokenPreferences');
  }

  @override
  Future<String> getTokenPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // si no existe el token devolvera un token vacio
    String preferences = prefs.getString('tokenPreferences') ?? '';
    return preferences;
  }

  @override
  Future<void> setTokenPreferences(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('tokenPreferences', token);
  }

  @override
  Future<bool> isLogged() async {
    return (await getTokenPreferences()).isNotEmpty;
  }
}
