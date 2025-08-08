import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/utils/responsive_utils.dart';

class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: ResponsiveUtils.getHorizontalPadding(context),
      child: Container(
        height: ResponsiveUtils.getResponsiveSpacing(context, 160),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [AppColors.darkSurface, AppColors.darkCard]
                : [AppColors.greyLight, AppColors.background],
          ),
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow.withOpacity(0.15),
              blurRadius: AppDimensions.blurRadiusMedium,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
            onTap: () {
              // TODO: Navigate to shop or promotional page
              print('Promotional banner tapped');
            },
            child: Row(
              children: [
                // Left side - Text content
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(
                        ResponsiveUtils.getResponsiveSpacing(context, 20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Shop with us!',
                          style: TextStyle(
                            fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context, AppDimensions.fontMedium),
                            color: isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                            height: ResponsiveUtils.getResponsiveSpacing(
                                context, 8)),
                        Text(
                          'Get 40% Off\nfor all items',
                          style: TextStyle(
                            fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context, AppDimensions.fontHeading),
                            color:
                                isDark ? AppColors.darkText : AppColors.black,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                            height: ResponsiveUtils.getResponsiveSpacing(
                                context, 16)),
                        // Fixed button layout to prevent overflow
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: ResponsiveUtils.getResponsiveSpacing(
                                context, 120),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveUtils.getResponsiveSpacing(
                                context, 12),
                            vertical: ResponsiveUtils.getResponsiveSpacing(
                                context, 8),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(
                                AppDimensions.radiusMedium),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.3),
                                blurRadius: AppDimensions.blurRadiusSmall,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Shop Now',
                                style: TextStyle(
                                  fontSize: AppDimensions.fontMedium,
                                  color: AppColors.textOnPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                  width: ResponsiveUtils.getResponsiveSpacing(
                                      context, 4)),
                              Icon(
                                Icons.arrow_forward,
                                size: AppDimensions.iconSmall,
                                color: AppColors.textOnPrimary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Right side - Image placeholder
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppDimensions.radiusLarge),
                        bottomRight: Radius.circular(AppDimensions.radiusLarge),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(AppDimensions.radiusLarge),
                        bottomRight: Radius.circular(AppDimensions.radiusLarge),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.productImagePlaceholder,
                              AppColors.productImagePlaceholder
                                  .withOpacity(0.8),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(
                                    ResponsiveUtils.getResponsiveSpacing(
                                        context, 12)),
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(0.9),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.person,
                                  size: ResponsiveUtils.getResponsiveSpacing(
                                      context, 40),
                                  color: AppColors.textLight,
                                ),
                              ),
                              SizedBox(
                                  height: ResponsiveUtils.getResponsiveSpacing(
                                      context, 8)),
                              Text(
                                'Man in Suit\nImage',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: AppDimensions.fontSmall,
                                  color: AppColors.textLight,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
