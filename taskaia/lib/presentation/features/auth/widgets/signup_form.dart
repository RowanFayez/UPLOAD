import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/app_button.dart';
import '../controller/auth_controller.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(hint: "Full Name", controller: nameController),
        const SizedBox(height: 16),
        AppTextField(hint: "Email", controller: emailController),
        const SizedBox(height: 16),
        AppTextField(hint: "Mobile Number", controller: phoneController),
        const SizedBox(height: 16),
        AppTextField(
          hint: "Password",
          controller: passwordController,
          obscureText: true,
        ),
        const SizedBox(height: 24),
        AppButton(
          label: "Sign Up",
          onPressed: () {
            authController
                .signup(
                  nameController.text.trim(),
                  emailController.text.trim(),
                  passwordController.text.trim(),
                  phoneController.text.trim(),
                )
                .then((_) {
                  Navigator.pop(context); // ✅ بعد sign up ارجعي لل login
                });
          },
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?"),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Log in"),
            ),
          ],
        ),
      ],
    );
  }
}
