import 'package:flutter/material.dart';
import '../../../../data/models/product.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
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