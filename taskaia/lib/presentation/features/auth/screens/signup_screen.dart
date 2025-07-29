import 'package:flutter/material.dart';
import 'package:taskaia/core/theme/app_strings.dart';
import 'package:taskaia/core/theme/app_dimensions.dart';
import 'package:taskaia/core/animation/slide_transition_wrapper.dart';
import 'package:taskaia/core/widgets/responsive_wrapper.dart';
import 'package:taskaia/core/utils/responsive_utils.dart';
import '../widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideTransitionWrapper(
      child: ResponsiveScaffold(
        useSafeArea: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.signUp,
                style: TextStyle(
                  fontSize: ResponsiveUtils.getResponsiveFontSize(
                    context,
                    AppDimensions.fontHeading,
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppDimensions.spacing8),
              const SignUpForm(),
              SizedBox(height: AppDimensions.spacing16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAccount,
                    style: TextStyle(
                      fontSize: ResponsiveUtils.getResponsiveFontSize(
                        context,
                        AppDimensions.fontMedium,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      AppStrings.login,
                      style: TextStyle(
                        fontSize: ResponsiveUtils.getResponsiveFontSize(
                          context,
                          AppDimensions.fontMedium,
                        ),
                      ),
                    ),
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