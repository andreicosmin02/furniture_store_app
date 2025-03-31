import 'package:flutter/material.dart';
import 'package:furniture_store_app/core/routes/app_router.dart';
import 'package:furniture_store_app/data/models/basket_item.dart';
import 'package:furniture_store_app/data/models/product.dart';
import 'package:furniture_store_app/state/auth_provider.dart';
import 'package:furniture_store_app/state/basket_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(BasketItemAdapter());

  // Open the basket box
  await Hive.openBox('basketBox');

  runApp(
    MultiProvider(
      providers: 
        [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => BasketProvider()),
        ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/login',
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}