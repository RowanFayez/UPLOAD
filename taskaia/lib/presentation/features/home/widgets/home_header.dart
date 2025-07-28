import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        'Discover products',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.darkText : AppColors.black,
        ),
      ),
    );
  }
}