import 'package:flutter/material.dart';
import 'package:taskaia/presentation/features/auth/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskAIA',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
