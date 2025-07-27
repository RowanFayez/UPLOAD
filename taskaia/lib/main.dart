import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/routing/app_routes.dart';

// Global key to get current context from anywhere
final GlobalKey<NavigatorState> appKey = GlobalKey<NavigatorState>();
BuildContext get appContext => appKey.currentContext!;

void main() {
  runApp(const AlexTramApp());
}

class AlexTramApp extends StatelessWidget {
  const AlexTramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: appKey,
      title: 'Alex Tram',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
