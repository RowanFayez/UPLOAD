import 'package:flutter/material.dart';
import '../../../../core/animation/page_transitions.dart';
import 'package:taskaia/core/managers/app_bottom_sheet.dart';
import 'package:taskaia/core/routing/app_routes.dart';
import 'package:taskaia/core/theme/theme_manager.dart';
import 'package:taskaia/data/datasources/product_data_source.dart';
import 'package:taskaia/presentation/features/product/screens/product_details_screen.dart';
import '../../../../core/theme/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/widgets/responsive_scaffold.dart';
import '../widgets/home_header.dart';
import '../widgets/category_section.dart';
import '../widgets/staggered_products_grid.dart';

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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ResponsiveScaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.background,
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: ResponsiveUtils.getResponsiveIconSize(
            context,
            AppDimensions.iconMedium,
          ),
        ),
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
            icon: Icon(
              Icons.logout,
              size: ResponsiveUtils.getResponsiveIconSize(
                context,
                AppDimensions.iconMedium,
              ),
            ),
            onPressed: _showLogoutConfirmation,
            tooltip: AppStrings.logout,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeHeader(),
          const CategorySection(categoryName: AppStrings.sofas),
          SizedBox(
            height: ResponsiveUtils.getResponsiveSpacing(
              context,
              AppDimensions.spacing20,
            ),
          ),
          StaggeredProductsGrid(
            products: sofas,
            onProductTap: (product) {
              // Enhanced transition for product details
              AppRoutes.navigateWithTransition(
                context,
                ProductDetailsScreen(product: product),
                transition: TransitionType.slideFromRight,
                duration: const Duration(
                  milliseconds: AppDimensions.animationVerySlow,
                ),
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
