import 'package:flutter/material.dart';
//Themes
import 'package:flutter_application_base/config/theme/index_themes.dart';
//Domains
import 'package:flutter_application_base/domain/entities/user_preferences.dart';
import 'package:flutter_application_base/domain/repositories/repositories.dart';
//Infrastructures
import 'package:flutter_application_base/infrastrucure/datasource/datasources.dart';
import 'package:flutter_application_base/infrastrucure/repositories/repositories.dart';
//Presentations
import 'package:flutter_application_base/presentation/providers/providers.dart';
import 'package:flutter_application_base/presentation/screens/screens.dart';
//Providers
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

    final CategorysRepository categorysRepository = CategorysRepositoryImp(
        categorysDatasource: MockCategorysDatasourceImpl());

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
        ChangeNotifierProvider(
            create: (_) =>
                CategorysProvider(categorysRepository: categorysRepository)),
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
    final UsersProvider usersProvider = Provider.of<UsersProvider>(context);
    //SharedUserPreferencesDatasourceImp sharedUserPreferencesDatasourceImp =
    //   SharedUserPreferencesDatasourceImp();

    if (usersProvider.loged) {
      userPreferencesProvider
          .setPreferencesByIdWithoutNotify(usersProvider.user.id)
          .then((c) {
        if (!userPreferencesProvider.entre) {
          userPreferencesProvider.notificar();
          userPreferencesProvider.entre = true;
        }
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
          'products': (context) => const ProductsScreen(),
          'categorys': (context) => const CategorysScreen(),
          'login': (context) => const LoginScreen(),
          'profile': (context) => const ProfileScreen(),
        }
        /* home: DesignScreen(), */
        );
  }
}
