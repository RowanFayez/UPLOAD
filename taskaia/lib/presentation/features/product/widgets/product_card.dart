import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_strings.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/utils/responsive_utils.dart';
import 'package:taskaia/data/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardHeight = ResponsiveUtils.getCardHeight(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: cardHeight,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.productBackground,
          borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: AppDimensions.blurRadiusMedium,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with Hero Animation
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppDimensions.radiusLarge),
                ),
                child: Hero(
                  tag: 'product-image-${product.id}',
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.productImagePlaceholder,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(AppDimensions.radiusLarge),
                      ),
                    ),
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.productImagePlaceholder,
                        child: Icon(
                          Icons.image_not_supported,
                          size: AppDimensions.iconXLarge,
                          color: AppColors.textLight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Product Details
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.spacing12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: ResponsiveUtils.getResponsiveFontSize(
                          context,
                          AppDimensions.fontLarge,
                        ),
                        fontWeight: FontWeight.bold,
                        color:
                            isDark ? AppColors.darkText : AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveUtils.getResponsiveSpacing(
                        context,
                        AppDimensions.spacing4,
                      ),
                    ),

                    // Product Description
                    Expanded(
                      child: Text(
                        product.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: ResponsiveUtils.getResponsiveFontSize(
                            context,
                            AppDimensions.fontSmall,
                          ),
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.textSecondary,
                          height: 1.3,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: ResponsiveUtils.getResponsiveSpacing(
                        context,
                        AppDimensions.spacing8,
                      ),
                    ),

                    // Rating and Price Row
                    Row(
                      children: [
                        // Rating
                        if (product.rating > 0) ...[
                          Icon(
                            Icons.star,
                            size: ResponsiveUtils.getResponsiveIconSize(
                              context,
                              AppDimensions.iconSmall,
                            ),
                            color: AppColors.ratingYellow,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            product.rating.toStringAsFixed(1),
                            style: TextStyle(
                              fontSize: ResponsiveUtils.getResponsiveFontSize(
                                context,
                                AppDimensions.fontSmall,
                              ),
                              color: isDark
                                  ? AppColors.darkTextSecondary
                                  : AppColors.textSecondary,
                            ),
                          ),
                          const Spacer(),
                        ],

                        // Price
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: ResponsiveUtils.getResponsiveFontSize(
                              context,
                              AppDimensions.fontLarge,
                            ),
                            fontWeight: FontWeight.w600,
                            color: AppColors.productPrice,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
