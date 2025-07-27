import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/product.dart';
import '../widgets/product_details_header.dart';
import '../widgets/product_details_content.dart';
import '../widgets/product_details_actions.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.background,
      body: Column(
        children: [
          // Product Image Section
          Expanded(
            flex: 3,
            child: ProductDetailsHeader(product: product),
          ),

          // Product Details Section
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : AppColors.productBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ProductDetailsContent(product: product),
                  ),
                  ProductDetailsActions(product: product),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}