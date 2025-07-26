import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/routing/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome Back",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Sign in to plan your journey in Alexandria",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),
              AppTextField(
                hint: "Enter your email",
                controller: emailController,
              ),
              const SizedBox(height: 16),
              AppTextField(
                hint: "Enter your password",
                obscureText: true,
                controller: passwordController,
              ),

              const SizedBox(height: 8),
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (val) =>
                        setState(() => rememberMe = val ?? false),
                  ),
                  const Text("Remember me"),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Forgot password?"),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              AppButton(
                label: "Sign In",
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.home);
                },
              ),

              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.signup),
                    child: const Text("Sign up"),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Text("Or continue as guest"),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () => Navigator.pushNamed(context, AppRoutes.home),
                child: const Text("Explore without account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
