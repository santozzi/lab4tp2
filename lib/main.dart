import 'package:flutter/material.dart';
import 'package:flutter_application_base/domain/repositories/user_repository.dart';
import 'package:flutter_application_base/helpers/preferences.dart';
import 'package:flutter_application_base/infrastrucure/datasource/mock_user_datasource_impl.dart';
import 'package:flutter_application_base/infrastrucure/repositories/user_repository_imp.dart';
import 'package:flutter_application_base/presentation/providers/users_provider.dart';
import 'package:flutter_application_base/presentation/screens/screens.dart';
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => UsersProvider(usuarioRepository: userRepository)),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'home',
          theme: Preferences.darkmode ? ThemeData.dark() : ThemeData.light(),
          routes: {
            'home': (context) => const HomeScreen(),
            'custom_list': (context) => const CustomListScreen(),
            'profile': (context) => const ProfileScreen(),
            'custom_list_item': (context) => const CustomListItem(),
          }
          /* home: DesignScreen(), */
          ),
    );
  }
}
