import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_imc_calc_app/access_denied_page.dart';
import 'package:my_imc_calc_app/modules/auth_guard.dart';
import 'package:my_imc_calc_app/admin_page.dart';
import 'package:my_imc_calc_app/home_screen.dart';
import 'package:my_imc_calc_app/login_page.dart';
import 'package:my_imc_calc_app/sales_page.dart';
import 'package:my_imc_calc_app/sales_page_profile.dart';
import 'custom_route_manager.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {

    // Definição de rotas comuns
    final routes = {
      '/': const HomeScreen(),
      '/login': const LoginPage(),
      '/admin-page': const AdminPage(),
      '/sales-page': const SalesPage(),
      '/sales-page-profile': const SalesPageProfile(),
      '/access-denied': const AccessDeniedPage(),
    };

    // Definição de Guards para rotas protegidas
    // Protegendo a rota Home
    final guards = {
      '/admin-page': [AuthGuard()],
      '/sales-page-profile': [AuthGuard()]
    };

    // Configuração das rotas usando o CustomRouteManager
    CustomRouteManager.setupRoutes(routes, r, guards: guards);
  }
}
