import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_imc_calc_app/access_denied_page.dart';
import 'package:my_imc_calc_app/admin_page.dart';
import 'package:my_imc_calc_app/home_screen.dart';
import 'package:my_imc_calc_app/login_page.dart';
import 'package:my_imc_calc_app/modules/custom_route_manager.dart';
import 'package:my_imc_calc_app/sales_page.dart';
import 'package:my_imc_calc_app/sales_page_profile.dart';
import 'app_routes.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    final routes = {
      AppRoutes.initial: const HomeScreen(),
      AppRoutes.login: const LoginPage(),
      AppRoutes.admin: const AdminPage(),
      AppRoutes.sales: const SalesPage(),
      AppRoutes.salesProfile: const SalesPageProfile(),
      AppRoutes.accessDenied: const AccessDeniedPage(),
    };

    CustomRouteManager.setupRoutes(
      routes: routes,
      routeManager: r,
      guards: AppRoutes.guardedRoutes,
    );
  }
}