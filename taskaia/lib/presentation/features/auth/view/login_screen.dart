import 'package:flutter/material.dart';
import 'package:taskaia/core/widgets/app_button.dart';
import 'package:taskaia/core/widgets/app_text_field.dart';
import 'signup_screen.dart';
class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 100, color: Colors.grey),
            const SizedBox(height: 24),
            AppTextField(
              hintText: 'Email Address',
              icon: Icons.email,
              controller: emailController,
            ),
            const SizedBox(height: 16),
            AppTextField(
              hintText: 'Password',
              icon: Icons.lock,
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(height: 24),
            AppButton(
              text: 'Login',
              onPressed: () {
                // login logic
              },
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignUpScreen()),
                );
              },
              child: const Text(
                'Register to New Account',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
