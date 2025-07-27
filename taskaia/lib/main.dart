import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_manager.dart';
import 'core/routing/app_routes.dart';

// Global key to get current context from anywhere
final GlobalKey<NavigatorState> appKey = GlobalKey<NavigatorState>();
BuildContext get appContext => appKey.currentContext!;

void main() {
  runApp(const AlexTramApp());
}

class AlexTramApp extends StatefulWidget {
  const AlexTramApp({super.key});

  @override
  State<AlexTramApp> createState() => _AlexTramAppState();
}

class _AlexTramAppState extends State<AlexTramApp> {
  final ThemeManager _themeManager = ThemeManager();

  @override
  void initState() {
    super.initState();
    _themeManager.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _themeManager.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: appKey,
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: _themeManager.lightTheme,
      darkTheme: _themeManager.darkTheme,
      themeMode: _themeManager.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
