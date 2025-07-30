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

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            // Product Image with Hero Animation - Fixed Aspect Ratio
            Expanded(
              flex: 2, // Changed from 3 to 2 to give more space for content
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
                    ),
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit
                          .cover, 
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

            // Product Details - Improved Layout
            Expanded(
              flex: 2, // Changed from 2 to 2 to balance with image
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.spacing12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Added this
                  children: [
                    // Product Name - Fixed Overflow
                    Flexible(
                      child: Text(
                        product.name,
                        maxLines: 2, // Changed from 1 to 2
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: AppDimensions.fontLarge,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? AppColors.darkText
                              : AppColors.textPrimary,
                          height: 1.2, // Added line height
                        ),
                      ),
                    ),

                    const SizedBox(height: AppDimensions.spacing4),

                    // Rating and Price Row - Fixed Layout
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Rating
                        if (product.rating > 0)
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: AppDimensions.iconSmall,
                                  color: AppColors.ratingYellow,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  product.rating.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: AppDimensions.fontSmall,
                                    color: isDark
                                        ? AppColors.darkTextSecondary
                                        : AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          const SizedBox(), // Empty space when no rating

                        // Price
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: AppDimensions.fontLarge,
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
