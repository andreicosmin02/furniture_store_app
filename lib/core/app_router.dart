import 'package:flutter/material.dart';
import 'package:furniture_store_app/ui/auth/login_screen.dart';
import 'package:furniture_store_app/ui/products/products_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/products':
        return MaterialPageRoute(builder: (_) => const ProductsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}