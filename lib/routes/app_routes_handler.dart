import 'package:flutter/cupertino.dart';
import 'package:my_imc_calc_app/core/features_domain/google_login/screens/google_login_screen.dart';
import 'package:my_imc_calc_app/core/features_domain/home_content/screens/home_screen.dart';

class AppRoutesHandler {
  static const String googleLogin = '/google_login_screen';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case googleLogin:
        return CupertinoPageRoute(
          builder: (_) => const GoogleLoginScreen(),
          settings: settings,
        );

      case home:
        final Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?; 
        return CupertinoPageRoute(
          builder: (_) => HomeScreen(data: args?['data']),
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
