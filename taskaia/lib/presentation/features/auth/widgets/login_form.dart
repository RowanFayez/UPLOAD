import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/routing/app_routes.dart';
import '../controller/auth_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(hint: 'Enter your email', controller: emailController),
        const SizedBox(height: 16),
        AppTextField(
          hint: 'Enter your password',
          controller: passwordController,
          obscureText: true,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: (val) => setState(() => rememberMe = val ?? false),
            ),
            const Text("Remember me"),
            const Spacer(),
            TextButton(onPressed: () {}, child: const Text("Forgot password?")),
          ],
        ),
        const SizedBox(height: 16),
        AppButton(
          label: "Sign In",
          onPressed: () {
            authController.login(
              emailController.text.trim(),
              passwordController.text.trim(),
            );
          },
        ),
      ],
    );
  }
}
