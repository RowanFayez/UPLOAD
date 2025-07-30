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
      padding: ResponsiveUtils.getHorizontalPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.homeWelcome,
            style: TextStyle(
              fontSize: ResponsiveUtils.getResponsiveFontSize(
                context,
                AppDimensions.fontHeading,
              ),
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.darkText : AppColors.black,
            ),
          ),
          SizedBox(
            height: ResponsiveUtils.getResponsiveSpacing(
              context,
              AppDimensions.spacing8,
            ),
          ),
          Text(
            AppStrings.discoverProducts,
            style: TextStyle(
              fontSize: ResponsiveUtils.getResponsiveFontSize(
                context,
                AppDimensions.fontLarge,
              ),
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
