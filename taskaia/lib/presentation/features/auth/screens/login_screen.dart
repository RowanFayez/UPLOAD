import 'package:flutter/material.dart';
import 'package:taskaia/core/theme/app_strings.dart';
import 'package:taskaia/core/managers/alert_manager.dart';
import 'package:taskaia/presentation/features/home/view/home_screen.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _handleLogin(BuildContext context) {
    AlertManager.showWelcomeToast();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.welcomeBack,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(AppStrings.signInToPlan),
              const SizedBox(height: 32),
              const LoginForm(),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppStrings.dontHaveAccount),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(AppStrings.createOne),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () => _handleLogin(context),
                  child: const Text(AppStrings.exploreAsGuest),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
