import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_strings.dart';
import '../../../../data/models/product.dart';

class ProductDetailsActions extends StatelessWidget {
  final Product product;

  const ProductDetailsActions({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          // Price Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.price, // Changed from hardcoded 'Price'
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkTextSecondary
                      : AppColors.textSecondary,
                ),
              ),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.productPrice,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Add to Cart Button
          ElevatedButton(
            onPressed: product.isAvailable ? () => _addToCart(context) : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              disabledBackgroundColor: AppColors.textLight,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              product.isAvailable
                  ? AppStrings.addToCart
                  : AppStrings.outOfStock, // Changed from hardcoded strings
              style: const TextStyle(
                color: AppColors.textOnPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addToCart(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${product.name} ${AppStrings.addedToCart}',
        ), // Changed from hardcoded string
        backgroundColor: AppColors.successGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
