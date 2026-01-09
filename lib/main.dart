import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 1. Import provider
import 'config/app_routes.dart';
import 'controllers/recipe_controller.dart'; // 2. Import controller Anda

void main() {
  runApp(
    // 3. Bungkus aplikasi dengan MultiProvider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COTS Recipe App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.dashboard,
      routes: AppRoutes.routes,
    );
  }
}