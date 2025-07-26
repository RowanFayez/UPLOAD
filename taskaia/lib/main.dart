import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/routing/app_routes.dart';

void main() {
  runApp(const AlexTramApp());
}

class AlexTramApp extends StatelessWidget {
  const AlexTramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alex Tram',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
