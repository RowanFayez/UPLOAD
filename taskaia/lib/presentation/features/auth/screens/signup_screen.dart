import 'package:flutter/material.dart';
import 'package:taskaia/core/theme/app_strings.dart';
import '../../../../../core/widgets/app_back_button.dart';
import '../widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppStrings.signUp,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const SignUpForm(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(AppStrings.alreadyHaveAccount),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(AppStrings.login),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
