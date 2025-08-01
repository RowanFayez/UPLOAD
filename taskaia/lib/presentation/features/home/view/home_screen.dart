import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/animation/page_transitions.dart';
import 'package:taskaia/core/managers/app_bottom_sheet.dart';
import 'package:taskaia/core/routing/app_routes.dart';
import 'package:taskaia/core/theme/theme_manager.dart';
import 'package:taskaia/core/di/injection.dart';
import 'package:taskaia/presentation/features/product/screens/product_details_screen.dart';
import '../controller/home_controller.dart';
import '../../../../core/theme/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/widgets/responsive_scaffold.dart';
import '../widgets/home_header.dart';
import '../widgets/category_chips.dart';
import '../widgets/staggered_products_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ThemeManager _themeManager = ThemeManager();
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = getIt<HomeController>();
    _loadData();
  }

  Future<void> _loadData() async {
    await _homeController.loadCategories();
    await _homeController.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ChangeNotifierProvider.value(
      value: _homeController,
      child: ResponsiveScaffold(
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
        body: Consumer<HomeController>(
          builder: (context, controller, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeHeader(),
                
                // Category Chips
                CategoryChips(
                  categories: controller.categories,
                  selectedCategory: controller.selectedCategory,
                  onCategorySelected: controller.selectCategory,
                ),
                
                SizedBox(
                  height: ResponsiveUtils.getResponsiveSpacing(
                    context,
                    AppDimensions.spacing20,
                  ),
                ),
                
                // Products Grid with Loading/Error States
                Expanded(
                  child: _buildProductsContent(controller),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductsContent(HomeController controller) {
    if (controller.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      );
    }

    if (controller.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.warningRed,
            ),
            SizedBox(height: AppDimensions.spacing16),
            Text(
              'Failed to load products',
              style: TextStyle(
                fontSize: AppDimensions.fontLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppDimensions.spacing8),
            Text(
              controller.error!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppDimensions.fontMedium,
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(height: AppDimensions.spacing24),
            ElevatedButton(
              onPressed: controller.retry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              child: Text(
                'Retry',
                style: TextStyle(
                  color: AppColors.textOnPrimary,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (controller.products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag_outlined,
              size: 64,
              color: AppColors.textLight,
            ),
            SizedBox(height: AppDimensions.spacing16),
            Text(
              'No products found',
              style: TextStyle(
                fontSize: AppDimensions.fontLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return StaggeredProductsGrid(
      products: controller.products,
      onProductTap: (product) {
        AppRoutes.navigateWithTransition(
          context,
          ProductDetailsScreen(product: product),
          transition: TransitionType.slideFromRight,
          duration: const Duration(
            milliseconds: AppDimensions.animationVerySlow,
          ),
        );
      },
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
