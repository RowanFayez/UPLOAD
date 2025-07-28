import 'package:flutter/material.dart';
import 'package:taskaia/core/managers/app_dialog.dart';
import 'package:taskaia/core/theme/app_strings.dart';
import 'package:taskaia/core/routing/app_routes.dart';
import 'package:taskaia/presentation/features/home/view/home_screen.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _showSignupInstructions(BuildContext context) {
    AppDialog.showInstructionDialog(
      context,
      title: AppStrings.signupInstructions,
      content: AppStrings.signupInstructionsBody,
      buttonText: AppStrings.gotIt,
      onPressed: () {
        Navigator.of(context).pop(); // Close dialog
        // Navigate to signup with slide transition
        AppRoutes.navigateToSignup(
          context,
          transition: TransitionType.slideFromRight,
        );
      },
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
                    onPressed: () => _showSignupInstructions(context),
                    child: const Text(AppStrings.createOne),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to home as guest with fade transition
                    AppRoutes.navigateWithTransition(
                      context,
                      const HomeScreen(),
                      transition: TransitionType.fade,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
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
