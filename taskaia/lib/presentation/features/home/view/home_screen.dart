import 'package:flutter/material.dart';
import '../../../../core/animation/slide_transition_wrapper.dart';
import '../../../../core/animation/page_transitions.dart';
import 'package:taskaia/core/managers/app_bottom_sheet.dart';
import 'package:taskaia/core/routing/app_routes.dart';
import 'package:taskaia/core/theme/theme_manager.dart';
import 'package:taskaia/data/products_data.dart';
import 'package:taskaia/presentation/features/product/screens/product_details_screen.dart';
import 'package:taskaia/presentation/features/product/widgets/product_card.dart';
import '../../../../core/theme/app_strings.dart';
import '../../../../core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ThemeManager _themeManager = ThemeManager();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final sofas = ProductsData.getSofas();

    return SlideTransitionWrapper(
      child: Scaffold(
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
            // Header Section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Discover products',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),

            // "Sofas" Category Label
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Sofas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Products Grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: sofas.length,
                  itemBuilder: (context, index) {
                    final product = sofas[index];
                    return ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransitions.slideTransition(
                            ProductDetailsScreen(product: product),
                            duration: const Duration(milliseconds: 500),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
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
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.login,
          (route) => false,
        );
      },
    );
  }
}
