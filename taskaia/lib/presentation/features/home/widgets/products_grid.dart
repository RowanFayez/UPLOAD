import 'package:flutter/material.dart';
import '../../../../data/models/product.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../product/widgets/product_card.dart';

class ProductsGrid extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onProductTap;

  const ProductsGrid({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: ResponsiveUtils.getHorizontalPadding(context),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ResponsiveUtils.getGridCrossAxisCount(context),
            childAspectRatio: ResponsiveUtils.getGridChildAspectRatio(context),
            crossAxisSpacing: ResponsiveUtils.getResponsiveSpacing(
              context,
              AppDimensions.gridSpacing,
            ),
            mainAxisSpacing: ResponsiveUtils.getResponsiveSpacing(
              context,
              AppDimensions.gridSpacing,
            ),
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductCard(
              product: product,
              onTap: () => onProductTap(product),
            );
          },
        ),
      ),
    );
  }
}
