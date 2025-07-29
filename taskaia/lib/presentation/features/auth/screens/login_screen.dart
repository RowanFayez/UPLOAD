import 'package:flutter/material.dart';
import 'package:taskaia/core/managers/app_dialog.dart';
import 'package:taskaia/core/theme/app_strings.dart';
import 'package:taskaia/core/theme/app_dimensions.dart';
import 'package:taskaia/core/routing/app_routes.dart';
import 'package:taskaia/core/widgets/responsive_wrapper.dart';
import 'package:taskaia/core/utils/responsive_utils.dart';
import 'package:taskaia/presentation/features/home/view/home_screen.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _showSignupInstructions(BuildContext context) {
    AppDialog.showInstructionDialog(
      context,
      title: AppStrings.signupInstructions,
      content: AppStrings.signupInstructionsBody,
      buttonText: AppStrings.gotIt,
      onPressed: () {
        Navigator.of(context).pop(); // Close dialog
        // Navigate to signup with slide transition
        AppRoutes.navigateToSignup(
          context,
          transition: TransitionType.slideFromRight,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      useSafeArea: true,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.welcomeBack,
                style: TextStyle(
                  fontSize: ResponsiveUtils.getResponsiveFontSize(
                    context,
                    AppDimensions.fontHeading,
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: AppDimensions.spacing8),
              Text(
                AppStrings.signInToPlan,
                style: TextStyle(
                  fontSize: ResponsiveUtils.getResponsiveFontSize(
                    context,
                    AppDimensions.fontLarge,
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.spacing32),
              const LoginForm(),
              SizedBox(height: AppDimensions.spacing24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.dontHaveAccount,
                    style: TextStyle(
                      fontSize: ResponsiveUtils.getResponsiveFontSize(
                        context,
                        AppDimensions.fontMedium,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _showSignupInstructions(context),
                    child: Text(
                      AppStrings.createOne,
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
              SizedBox(height: AppDimensions.spacing16),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to home as guest with fade transition
                    AppRoutes.navigateWithTransition(
                      context,
                      const HomeScreen(),
                      transition: TransitionType.fade,
                      duration: Duration(milliseconds: AppDimensions.animationExtraSlow),
                    );
                  },
                  child: Text(
                    AppStrings.exploreAsGuest,
                    style: TextStyle(
                      fontSize: ResponsiveUtils.getResponsiveFontSize(
                        context,
                        AppDimensions.fontMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
