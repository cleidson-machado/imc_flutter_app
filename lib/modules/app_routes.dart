import 'package:my_imc_calc_app/modules/auth_guard.dart';

abstract class AppRoutes {
  
  // Base Routes
  static const String initial = '/';
  static const String login = '/login';
  static const String admin = '/admin';
  static const String sales = '/sales';
  static const String salesProfile = '/sales/profile';
  static const String accessDenied = '/access-denied';
  
  // Nested Routes (if needed)
  static const String adminDashboard = '$admin/dashboard';
  static const String adminSettings = '$admin/settings';
  
  // Route Groups (for organization)
  static final adminRoutes = [admin, adminDashboard, adminSettings];
  static final salesRoutes = [sales, salesProfile];
  
  // Helper methods
  static String getSalesProfilePath(String userId) => '$salesProfile/$userId';
  
  // Route Guards mapping
  static final guardedRoutes = {
    admin: [AuthGuard()],
    salesProfile: [AuthGuard()],
  };
}