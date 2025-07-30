import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../data/models/product.dart';

class ProductDetailsHeader extends StatelessWidget {
  final Product product;

  const ProductDetailsHeader({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        // Product Image with Hero Animation
        Container(
          width: double.infinity,
          height: double.infinity,
          margin: ResponsiveUtils.getHorizontalPadding(context),
          child: Hero(
            tag: 'product-image-${product.id}',
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.cardShadow,
                    blurRadius: AppDimensions.blurRadiusLarge,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
                child: AspectRatio(
                  aspectRatio: 1.0, // Fixed aspect ratio to match ProductCard
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.productImagePlaceholder,
                    ),
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.productImagePlaceholder,
                        child: Icon(
                          Icons.image_not_supported,
                          size: ResponsiveUtils.getResponsiveIconSize(
                            context,
                            AppDimensions.iconXXLarge,
                          ),
                          color: AppColors.textLight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Back Button
        Positioned(
          top: MediaQuery.of(context).padding.top +
              ResponsiveUtils.getResponsiveSpacing(
                context,
                AppDimensions.spacing8,
              ),
          left: ResponsiveUtils.getResponsiveSpacing(
            context,
            AppDimensions.spacing16,
          ),
          child: Container(
            margin: const EdgeInsets.all(AppDimensions.spacing8),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkCard : AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.cardShadow,
                  blurRadius: AppDimensions.blurRadiusSmall,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: ResponsiveUtils.getResponsiveIconSize(
                  context,
                  AppDimensions.iconMedium,
                ),
                color: isDark ? AppColors.darkText : AppColors.textPrimary,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
      ],
    );
  }
}
