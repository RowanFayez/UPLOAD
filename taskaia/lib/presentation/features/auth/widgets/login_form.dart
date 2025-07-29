import 'package:flutter/material.dart';
import 'package:taskaia/core/managers/app_toast.dart';
import 'package:taskaia/core/theme/app_strings.dart';
import 'package:taskaia/core/theme/app_dimensions.dart';
import 'package:taskaia/core/routing/app_routes.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../controller/auth_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authController = AuthController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await _authController.login(
          _emailController.text,
          _passwordController.text,
        );

        // Show success toast
        if (mounted) {
          AppToast.showSuccess(
            context,
            AppStrings.welcomeToFamily,
            subtitle: AppStrings.loginSuccess,
          );

          // Navigate to home after a short delay with slide and fade transition
          Future.delayed(const Duration(milliseconds: 500), () {
            if (mounted) {
              AppRoutes.navigateToHome(
                context,
                clearStack: true,
                transition: TransitionType.slideFade,
              );
            }
          });
        }
      } catch (e) {
        // Handle error if needed
        debugPrint('Login error: $e');
        if (mounted) {
          AppToast.showSuccess(context, AppStrings.loginError);
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: _emailController,
            label: AppStrings.email,
            hint: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                value!.isEmpty ? AppStrings.emailRequired : null,
          ),
          SizedBox(height: AppDimensions.spacing16),
          CustomTextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            label: AppStrings.password,
            hint: 'Enter your password',
            validator: (value) =>
                value!.isEmpty ? AppStrings.passwordRequired : null,
          ),
          SizedBox(height: AppDimensions.spacing24),
          CustomButton(
            text: AppStrings.login,
            onPressed: _handleLogin,
            isLoading: _isLoading,
            isFullWidth: true,
            size: ButtonSize.large,
          ),
        ],
      ),
    );
  }
}
