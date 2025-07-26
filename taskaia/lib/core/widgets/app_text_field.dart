import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController controller;

  const AppTextField({
    super.key,
    required this.hint,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: obscureText ? const Icon(Icons.visibility_off) : null,
      ),
    );
  }
}
