import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/repositories/user_repository.dart';
import 'package:flutter_application_base/domain/repositories/products_repository.dart';
import 'package:flutter_application_base/config/helpers/preferences.dart';
import 'package:flutter_application_base/infrastrucure/datasource/mock_products_datasource_impl.dart';
import 'package:flutter_application_base/infrastrucure/datasource/mock_user_datasource_impl.dart';
import 'package:flutter_application_base/infrastrucure/repositories/products_repository_imp.dart';
import 'package:flutter_application_base/infrastrucure/repositories/user_repository_imp.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:flutter_application_base/presentation/providers/products_provider.dart';
import 'package:flutter_application_base/presentation/screens/screens.dart';
import 'package:flutter_application_base/presentation/screens/users/user_screen.dart';
//provider
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();

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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => UsersProvider(usuarioRepository: userRepository)),
        ChangeNotifierProvider(
            create: (_) =>
                ProductsProvider(productsRepository: productsRepository)),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'users',
          theme: Preferences.darkmode ? ThemeData.dark() : ThemeData.light(),
          routes: {
            'home': (context) => const HomeScreen(),
            'custom_list': (context) => const CustomListScreen(),
            'profile': (context) => const ProfileScreen(),
            'custom_list_item': (context) => const CustomListItem(),
            'users': (context) => const UsersScreen(),
            'user': (context) => const UserScreen(),
            'products': (context) => const ProductScreen(),
          }
          /* home: DesignScreen(), */
          ),
    );
  }
}
