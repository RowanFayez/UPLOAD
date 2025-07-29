import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_strings.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/utils/responsive_utils.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.all(AppDimensions.spacing20),
      child: Text(
        AppStrings.discoverProducts,
        style: TextStyle(
          fontSize: ResponsiveUtils.getResponsiveFontSize(
            context,
            AppDimensions.fontDisplay,
          ),
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.darkText : AppColors.black,
        ),
      ),
    );
  }
}
