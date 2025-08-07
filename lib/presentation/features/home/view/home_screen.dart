import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/animation/page_transitions.dart';
import 'package:taskaia/core/managers/app_bottom_sheet.dart';
import 'package:taskaia/core/routing/app_routes.dart';
import 'package:taskaia/core/theme/theme_manager.dart';
import 'package:taskaia/core/di/injection.dart';
import 'package:taskaia/presentation/features/product/screens/product_details_screen.dart';
import 'package:taskaia/presentation/features/cart/cart_screen.dart';
import '../controller/home_controller.dart';
import '../../../../core/theme/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimensions.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../../core/widgets/responsive_scaffold.dart';
import '../widgets/home_header.dart';
import '../widgets/category_chips.dart';
import '../widgets/products_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ThemeManager _themeManager = ThemeManager();
  late HomeController _homeController;
  int _currentIndex = 0;

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
      child: Scaffold(
        backgroundColor:
            isDark ? AppColors.darkBackground : AppColors.background,
        body: Consumer<HomeController>(
          builder: (context, controller, child) {
            return Column(
              children: [
                // Status Bar and Header
                _buildStatusBar(),
                _buildHeader(),

                // Search Bar
                _buildSearchBar(),

                // Promotional Banner
                _buildPromotionalBanner(),

                // Category Chips
                _buildCategoryChips(controller),

                // Products Grid
                Expanded(
                  child: _buildProductsContent(controller),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: _buildBottomNavigation(),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.homeTitle,
            style: TextStyle(
              fontSize: AppDimensions.fontLarge,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          Row(
            children: [
              Icon(Icons.signal_cellular_4_bar,
                  size: 16, color: AppColors.textPrimary),
              const SizedBox(width: 4),
              Icon(Icons.wifi, size: 16, color: AppColors.textPrimary),
              const SizedBox(width: 4),
              Icon(Icons.battery_full, size: 16, color: AppColors.textPrimary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.homeWelcome,
                style: TextStyle(
                  fontSize: AppDimensions.fontMedium,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                'Falcon Thought',
                style: TextStyle(
                  fontSize: AppDimensions.fontLarge,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_bag,
              color: AppColors.textPrimary,
              size: 24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: AppStrings.discoverProducts,
          hintStyle: TextStyle(
            color: AppColors.textLight,
            fontSize: AppDimensions.fontMedium,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.textLight,
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  Widget _buildPromotionalBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.shopWithUs,
                  style: TextStyle(
                    fontSize: AppDimensions.fontLarge,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.getDiscount,
                  style: TextStyle(
                    fontSize: AppDimensions.fontMedium,
                    color: AppColors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    AppStrings.shopNow,
                    style: TextStyle(
                      fontSize: AppDimensions.fontMedium,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              Icons.person,
              size: 40,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips(HomeController controller) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          final isSelected = controller.selectedCategory == category;

          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: FilterChip(
              label: Text(
                category == 'all' ? AppStrings.all : category,
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              selected: isSelected,
              onSelected: (_) => controller.selectCategory(category),
              backgroundColor: AppColors.greyLight,
              selectedColor: AppColors.primary,
              checkmarkColor: AppColors.white,
            ),
          );
        },
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

    return ProductsGrid(
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

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });

        if (index == 1) {
          // Cart
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CartScreen()),
          );
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textLight,
      items: [
        BottomNavigationBarItem(
          icon: Icon(_currentIndex == 0 ? Icons.home : Icons.home_outlined),
          label: AppStrings.homeTitle,
        ),
        BottomNavigationBarItem(
          icon:
              Icon(_currentIndex == 1 ? Icons.favorite : Icons.favorite_border),
          label: AppStrings.wishlist,
        ),
        BottomNavigationBarItem(
          icon: Icon(_currentIndex == 2
              ? Icons.notifications
              : Icons.notifications_outlined),
          label: AppStrings.notifications,
        ),
        BottomNavigationBarItem(
          icon: Icon(_currentIndex == 3 ? Icons.person : Icons.person_outline),
          label: AppStrings.profile,
        ),
      ],
    );
  }
}
