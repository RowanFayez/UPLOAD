import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/product.dart';
import 'product_rating_widget.dart';

class ProductDetailsContent extends StatelessWidget {
  final Product product;

  const ProductDetailsContent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // Product Name
          Text(
            product.name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isDark ? AppColors.darkText : AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 12),

          // Rating and Reviews
          ProductRatingWidget(
            rating: product.rating,
            reviewCount: product.reviewCount,
          ),

          const SizedBox(height: 16),

          // Product Description
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                product.description,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: isDark ? AppColors.darkTextSecondary : AppColors.textSecondary,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}