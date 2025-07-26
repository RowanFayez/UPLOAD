import 'package:flutter/material.dart';
import 'package:taskaia/core/theme/app_strings.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: AppStrings.email),
            validator: (value) =>
                value!.isEmpty ? AppStrings.emailRequired : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: AppStrings.password,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            validator: (value) =>
                value!.isEmpty ? AppStrings.passwordRequired : null,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Handle login
              }
            },
            child: const Text(AppStrings.login),
          ),
        ],
      ),
    );
  }
}
