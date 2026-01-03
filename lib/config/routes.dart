import 'package:flutter/material.dart';
import '../features/auth/ui/login_screen.dart';
import '../features/user/ui/user_home_screen.dart';
import '../features/admin/ui/admin_dashboard.dart';

class AppRoutes {
  static const login = '/login';
  static const userHome = '/user-home';
  static const adminHome = '/admin-home';

  static Map<String, WidgetBuilder> routes = {
    login: (_) => const LoginScreen(),
    userHome: (_) => const UserHomeScreen(),
    adminHome: (_) => const AdminDashboard(),
  };
}
