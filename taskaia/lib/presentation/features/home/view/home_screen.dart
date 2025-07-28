import 'package:flutter/material.dart';
import '../../../../core/animation/page_transitions.dart';
import 'package:taskaia/core/managers/app_bottom_sheet.dart';
import 'package:taskaia/core/routing/app_routes.dart';
import 'package:taskaia/core/theme/theme_manager.dart';
import 'package:taskaia/data/datasources/product_data_source.dart';
import 'package:taskaia/presentation/features/product/screens/product_details_screen.dart';
import '../../../../core/theme/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/home_header.dart';
import '../widgets/category_section.dart';
import '../widgets/products_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ThemeManager _themeManager = ThemeManager();

  @override
  Widget build(BuildContext context) {
    final sofas = ProductDataSource.getSofas();

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, size: 24),
        actions: [
          Switch(
            value: _themeManager.isDarkMode,
            onChanged: (value) {
              _themeManager.toggleTheme();
              setState(() {});
            },
            activeColor: AppColors.primary,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _showLogoutConfirmation,
            tooltip: AppStrings.logout,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeader(),
          const CategorySection(
            categoryName: AppStrings.sofas,
          ), // Using AppStrings
          const SizedBox(height: 20),
          ProductsGrid(
            products: sofas,
            onProductTap: (product) {
              // Enhanced transition for product details
              AppRoutes.navigateWithTransition(
                context,
                ProductDetailsScreen(product: product),
                transition: TransitionType.slideFromRight,
                duration: const Duration(milliseconds: 500),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmation() {
    AppBottomSheet.showConfirmationSheet(
      context,
      title: AppStrings.logoutConfirmation,
      message: AppStrings.logoutWarning,
      confirmText: AppStrings.confirmLogout,
      cancelText: AppStrings.cancel,
      confirmColor: AppColors.warningRed,
      onConfirm: () {
        Navigator.of(context).pop();
        // Enhanced navigation back to login
        AppRoutes.navigateToLogin(
          context,
          clearStack: true,
          transition: TransitionType.slideFromLeft,
        );
      },
    );
  }
}
