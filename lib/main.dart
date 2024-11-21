import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_base/config/theme/index_themes.dart';
import 'package:flutter_application_base/domain/entities/user_preferences.dart';
import 'package:flutter_application_base/domain/repositories/user_preferences_repositoriy.dart';
import 'package:flutter_application_base/domain/repositories/user_repository.dart';
import 'package:flutter_application_base/domain/repositories/products_repository.dart';
import 'package:flutter_application_base/infrastrucure/datasource/mock_products_datasource_impl.dart';
import 'package:flutter_application_base/infrastrucure/datasource/mock_user_datasource_impl.dart';
import 'package:flutter_application_base/infrastrucure/datasource/shared_user_preferences_datasource_imp.dart';
import 'package:flutter_application_base/infrastrucure/repositories/products_repository_imp.dart';
import 'package:flutter_application_base/infrastrucure/repositories/shared_user_preferences_repository.dart';
import 'package:flutter_application_base/infrastrucure/repositories/user_repository_imp.dart';
import 'package:flutter_application_base/presentation/providers/user_preferences_provider.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:flutter_application_base/presentation/providers/products_provider.dart';
import 'package:flutter_application_base/presentation/screens/screens.dart';
import 'package:flutter_application_base/presentation/screens/users/user_screen.dart';
//provider
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository =
        UserRepositoryImp(userDatasource: MockUserDatasourceImpl());

    final ProductsRepository productsRepository =
        ProductsRepositoryImp(productsDatasource: MockProductsDatasourceImpl());
    final UserPreferencesRepository userPreferencesRepository =
        SharedUserPreferencesRepository(
            userPreferencesDataSource: SharedUserPreferencesDatasourceImp());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => UsersProvider(usuarioRepository: userRepository)),
        ChangeNotifierProvider(
            create: (_) =>
                ProductsProvider(productsRepository: productsRepository)),
        ChangeNotifierProvider(
            create: (_) => UserPreferencesProvider(
                userPreferencesRepository: userPreferencesRepository)),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final UserPreferencesProvider userPreferencesProvider =
        Provider.of<UserPreferencesProvider>(context);
    //SharedUserPreferencesDatasourceImp sharedUserPreferencesDatasourceImp =
    //   SharedUserPreferencesDatasourceImp();
    if (!userPreferencesProvider.entre) {
      userPreferencesProvider.entre = true;
      userPreferencesProvider.setPreferencesById('1019').then((c) {
        log('cargando...');
      });
    }
    //sharedUserPreferencesDatasourceImp.toString2();

    UserPreferences userPreferences = userPreferencesProvider.getPreferences();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        theme: IndexThemes(
          theme: userPreferences.theme,
        ).getTheme(userPreferences
            .isDarkMode), //Preferences.darkmode ? ThemeData.dark() : ThemeData.light(),
        routes: {
          'home': (context) => const HomeScreen(),
          'custom_list': (context) => const CustomListScreen(),
          'custom_list_item': (context) => const CustomListItem(),
          'users': (context) => const UsersScreen(),
          'user': (context) => const UserScreen(),
          'products': (context) => const ProductScreen(),
        }
        /* home: DesignScreen(), */
        );
  }
}
