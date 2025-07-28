import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class CategorySection extends StatelessWidget {
  final String categoryName;

  const CategorySection({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        categoryName,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
