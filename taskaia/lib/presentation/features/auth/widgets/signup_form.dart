import 'package:flutter/material.dart';
import 'package:taskaia/core/theme/app_strings.dart';
import 'package:taskaia/core/theme/app_dimensions.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../controller/auth_controller.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            label: AppStrings.name,
            hint: 'Enter your full name',
            validator: (value) =>
                value!.isEmpty ? AppStrings.nameRequired : null,
          ),
          SizedBox(height: AppDimensions.spacing16),
          CustomTextField(
            label: AppStrings.email,
            hint: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                value!.isEmpty ? AppStrings.emailRequired : null,
          ),
          SizedBox(height: AppDimensions.spacing16),
          CustomTextField(
            label: AppStrings.phone,
            hint: 'Enter your phone number',
            keyboardType: TextInputType.phone,
            validator: (value) =>
                value!.isEmpty ? AppStrings.phoneRequired : null,
          ),
          SizedBox(height: AppDimensions.spacing16),
          CustomTextField(
            obscureText: _obscurePassword,
            label: AppStrings.password,
            hint: 'Enter your password',
            validator: (value) =>
                value!.isEmpty ? AppStrings.passwordRequired : null,
          ),
          SizedBox(height: AppDimensions.spacing24),
          CustomButton(
            text: AppStrings.signUp,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context);
              }
            },
            isFullWidth: true,
            size: ButtonSize.large,
          ),
        ],
      ),
    );
  }
}
