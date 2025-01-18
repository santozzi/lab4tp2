// Falta actualizar carts en presentation
import 'dart:developer';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import 'package:flutter/material.dart';
//Themes
import 'package:flutter_application_base/config/theme/index_themes.dart';
import 'package:flutter_application_base/domain/datasource/token_preferences_datasource.dart';
import 'package:flutter_application_base/domain/entities/cart/product_cart_entity.dart';
import 'package:flutter_application_base/domain/entities/user/user_entity.dart';

//Domains
import 'package:flutter_application_base/domain/entities/user/user_preferences.dart';
import 'package:flutter_application_base/domain/repositories/repositories.dart';
import 'package:flutter_application_base/domain/repositories/token_preferences_repository.dart';
import 'package:flutter_application_base/infrastrucure/datasource/api/categories_datasource_imp.dart';
import 'package:flutter_application_base/infrastrucure/datasource/api/product_datasource_imp.dart';
import 'package:flutter_application_base/infrastrucure/datasource/shared_cart_preferences_datasource_imp.dart';
import 'package:flutter_application_base/infrastrucure/datasource/user/shared_token_preferences_datasource_imp.dart';
import 'package:flutter_application_base/infrastrucure/datasource/api/user_datasource_imp.dart';
//Infrastructures
import 'package:flutter_application_base/infrastrucure/datasource/datasources.dart';

import 'package:flutter_application_base/infrastrucure/repositories/repositories.dart';
import 'package:flutter_application_base/infrastrucure/repositories/token_repository_imp.dart';
//Presentations
import 'package:flutter_application_base/presentation/providers/providers.dart';
import 'package:flutter_application_base/presentation/screens/screens.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
//Providers
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository =
        UserRepositoryImp(userDatasource: UserDatasoureceImp());

    final ProductsRepository productsRepository =
        ProductsRepositoryImp(productsDatasource: ProductDatasoureceImp());

    final UserPreferencesRepository userPreferencesRepository =
        SharedUserPreferencesRepository(
            userPreferencesDataSource: SharedUserPreferencesDatasourceImp());
    final CartsRepository cartsRepository = CartsRepositoryImp(
        cartsDatasource: SharedCartPreferencesDatasourceImp());

    SharedCartPreferencesDatasourceImp cart =
        SharedCartPreferencesDatasourceImp();
/*     cart.deleteCart("1").then((value) {
      log("en main: ");
    }); */
/*     cart.getCart("2").then((value) {
      //value.products.add(ProductCartEntity(productId: 1, quantity: 5));
      log("en main: agrego cart 2: value: ${value.toString()}");
    });
    cart.addCartProduct("2", ProductCartEntity(productId: 3, quantity: 5));
    cart.getCarts().then((value) {
      log("en main: ${value.toString()}");
    }); */

    final CategoriesRepository categoriesRepository = CategoriesRepositoryImp(
        categoriesDatasource: CategoriesDatasourceImp());
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
            create: (_) => CartsProvider(cartsRepository: cartsRepository)),
        ChangeNotifierProvider(
            create: (_) =>
                CategoriesProvider(categoriesRepository: categoriesRepository)),
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

    usersProvider.isLogged().then((value) {
      log("en app: ${value.username}");
      userPreferencesProvider
          .setPreferencesByIdWithoutNotify(usersProvider.user.id)
          .then((c) {
        if (!userPreferencesProvider.entre) {
          userPreferencesProvider.notificar();
          userPreferencesProvider.entre = true;
        }
      });
    });
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
    log("valor de entre: ${userPreferencesProvider.entre}");

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
          'users': (context) => const UsersScreen(),
          'user': (context) => const UserScreen(),
          'products': (context) => const ProductsScreen(),
          'categories': (context) => const CategoriesScreen(),
          'login': (context) => const LoginScreen(),
          'profile': (context) => const ProfileScreen(),
          'carts': (context) => const CartsScreen(),
        }
        /* home: DesignScreen(), */
        );
    ;
  }
}
