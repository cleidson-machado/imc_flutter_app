import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_imc_calc_app/access_denied_page.dart';
import 'package:my_imc_calc_app/auth_guard.dart';
import 'package:my_imc_calc_app/home_page.dart';
import 'package:my_imc_calc_app/home_screen.dart';
import 'package:my_imc_calc_app/login_page.dart';
import 'custom_route_manager.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    // Definição de rotas comuns
    final routes = {
      '/': const HomeScreen(),
      '/login': const LoginPage(),
      '/home': const HomePage(),
      '/access-denied': const AccessDeniedPage(),
    };

    // Definição de Guards para rotas protegidas
    final guards = {
      '/home': [AuthGuard()], // Protegendo a rota Home
    };

    // Configuração das rotas usando o CustomRouteManager
    CustomRouteManager.setupRoutes(routes, r, guards: guards);
  }
}
