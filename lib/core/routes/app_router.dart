import 'package:flutter/material.dart';
import 'package:furniture_store_app/ui/screens/auth/login_screen.dart';
import 'package:furniture_store_app/ui/screens/basket/basket_screen.dart';
import 'package:furniture_store_app/ui/screens/products/products_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/products':
        return MaterialPageRoute(builder: (_) => const ProductsScreen());
      case '/basket':
        return MaterialPageRoute(builder: (_) => const BasketScreen());
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