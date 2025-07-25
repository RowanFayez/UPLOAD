import 'package:flutter/material.dart';
import 'package:taskaia/core/widgets/app_button.dart';
import 'package:taskaia/core/widgets/app_text_field.dart';


class SignUpScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_add, size: 100, color: Colors.grey),
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
              text: 'Sign Up',
              onPressed: () {
                // register logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
