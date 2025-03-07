import 'package:flutter/cupertino.dart';
import 'package:my_imc_calc_app/modules/core_auth/screens/core_auth_login_screen.dart';
import 'package:my_imc_calc_app/modules/core_auth_google/screens/core_google_login_screen.dart';
import 'package:my_imc_calc_app/modules/home_content/screens/home_content_screen.dart';
import 'package:my_imc_calc_app/modules/user/screens/user_list_screen.dart';

class AppRoutesHandler {
  static const String rootLogin = '/root_login';
  static const String googleLogin = '/google_login';
  //APPLE LOGIN
  //FACEBOOK LOGIN
  static const String home = '/home';
  static const String userList = '/user_list';  
  

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case rootLogin:
        return CupertinoPageRoute(
          builder: (_) => const CoreAuthLoginScreen(),
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
          builder: (_) => HomeContentScreen(data: args?['data']),
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
