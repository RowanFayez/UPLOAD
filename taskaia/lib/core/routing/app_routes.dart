import 'package:flutter/material.dart';
import '../../presentation/features/auth/screens/login_screen.dart';
import '../../presentation/features/auth/screens/signup_screen.dart';
import '../../presentation/features/home/view/home_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String signup = '/signup';
  static const String home = '/home';

  static final Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginScreen(),
    signup: (context) => const SignUpScreen(),
    home: (context) => const HomeScreen(),
  };
}
