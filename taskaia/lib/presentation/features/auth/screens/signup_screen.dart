import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_back_button.dart';
import '../controller/auth_controller.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/app_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final phoneController = TextEditingController();
    final authController = AuthController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBackButton(),
              const SizedBox(height: 24),
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text("Sign up to get started"),
              const SizedBox(height: 24),
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
                  authController.signup(
                    nameController.text.trim(),
                    emailController.text.trim(),
                    passwordController.text.trim(),
                    phoneController.text.trim(),
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Log in"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
