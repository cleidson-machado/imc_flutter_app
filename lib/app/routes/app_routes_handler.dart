import 'package:flutter/cupertino.dart';
import 'package:my_imc_calc_app/modules/core_google_login/screens/core_google_login_screen.dart';
import 'package:my_imc_calc_app/modules/home_content/screens/home_screen.dart';
import 'package:my_imc_calc_app/modules/user_content/screens/user_list_screen.dart';
import 'package:my_imc_calc_app/screens_lab/login_screen.dart';

class AppRoutesHandler {
  static const String login = '/login';
  static const String googleLogin = '/google_login_screen';
  //APPLE LOGIN
  //FACEBOOK LOGIN
  static const String home = '/home';
  static const String userList = '/user_list';
  

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return CupertinoPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );

      case googleLogin:
        return CupertinoPageRoute(
          builder: (_) => const GoogleLoginScreen(),
          settings: settings,
        );

      case home:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return CupertinoPageRoute(
          builder: (_) => HomeScreen(data: args?['data']),
          settings: settings,
        );

      case userList:
        return CupertinoPageRoute(
          builder: (_) => const UserListScreen(),
          settings: settings,
        );

      default:
        return CupertinoPageRoute(
          builder: (_) => const CupertinoPageScaffold(
            child: Center(child: Text('Rota não encontrada!')),
          ),
        );
    }
  }
}
