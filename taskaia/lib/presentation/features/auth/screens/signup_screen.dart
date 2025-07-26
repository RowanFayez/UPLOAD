import 'package:flutter/material.dart';
import '../../../../../core/widgets/app_back_button.dart';
import '../widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AppBackButton(),
              SizedBox(height: 24),
              Text(
                "Create Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("Sign up to get started"),
              SizedBox(height: 24),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
