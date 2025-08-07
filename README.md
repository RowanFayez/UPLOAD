# Taskaia - E-Commerce Flutter App

A modern, responsive Flutter e-commerce application built with clean architecture, featuring product browsing, cart management, and a beautiful UI design.

## 🚀 Features

### ✅ E-Commerce Functionality
- **Product Browsing**: Browse products with category filtering
- **Product Details**: Full-screen product images with action buttons
- **Shopping Cart**: Add, remove, and manage cart items
- **Responsive Design**: Works perfectly on all screen sizes
- **API Integration**: Real-time data from FakeStore API

### ✅ Clean Architecture
- **No Hard-coded Values**: All colors, strings, and dimensions are centralized
- **Dependency Injection**: Using GetIt and Injectable for proper DI
- **State Management**: Provider pattern for reactive UI
- **API Layer**: Dio and Retrofit for type-safe HTTP requests

### 🎨 Design System
- **AppColors**: Centralized color management with dark/light theme support
- **AppDimensions**: Consistent spacing, sizing, and typography
- **AppStrings**: Localized text management
- **ResponsiveUtils**: Smart responsive design utilities

## 📁 Complete Project File System Design

```
taskaia/
├── 📄 analysis_options.yaml
├── 📄 pubspec.yaml
├── 📄 pubspec.lock
├── 📄 README.md
│
├── 📁 android/                          # Android platform files
│   ├── 📁 app/
│   │   ├── 📁 src/
│   │   │   ├── 📁 main/
│   │   │   │   ├── 📁 kotlin/
│   │   │   │   │   └── 📁 com/example/taskaia/
│   │   │   │   │       └── 📄 MainActivity.kt
│   │   │   │   ├── 📁 res/
│   │   │   │   │   ├── 📁 drawable/
│   │   │   │   │   ├── 📁 mipmap-*/
│   │   │   │   │   └── 📁 values/
│   │   │   │   └── 📄 AndroidManifest.xml
│   │   │   └── 📁 debug/
│   │   └── 📄 build.gradle.kts
│   ├── 📄 build.gradle.kts
│   └── 📁 gradle/
│
├── 📁 ios/                              # iOS platform files
│   ├── 📁 Runner/
│   │   ├── 📁 Assets.xcassets/
│   │   ├── 📁 Base.lproj/
│   │   └── 📄 Info.plist
│   └── 📁 Runner.xcodeproj/
│
├── 📁 web/                              # Web platform files
│   ├── 📄 index.html
│   ├── 📄 manifest.json
│   └── 📁 icons/
│
├── 📁 windows/                          # Windows platform files
│   ├── 📁 runner/
│   └── 📄 CMakeLists.txt
│
├── 📁 macos/                            # macOS platform files
│   └── 📁 Runner/
│
├── 📁 linux/                            # Linux platform files
│   └── 📁 runner/
│
├── 📁 assets/                           # Static assets
│   ├── 📁 images/
│   │   ├── 📄 sofa1.jpg
│   │   ├── 📄 sofa2.png
│   │   ├── 📄 sofa3.png
│   │   └── 📄 sofa4.jpg
│   └── 📄 tram.png
│
├── 📁 test/                             # Test files
│   └── 📄 widget_test.dart
│
└── 📁 lib/                              # Main Dart source code
    ├── 📄 main.dart                     # App entry point
    │
    ├── 📁 core/                         # Core functionality
    │   ├── 📁 animation/
    │   │   ├── 📄 page_transitions.dart
    │   │   └── 📄 slide_transition_wrapper.dart
    │   │
    │   ├── 📁 di/                       # Dependency Injection
    │   │   ├── 📄 injection.dart
    │   │   └── 📄 injection.config.dart  # Generated
    │   │
    │   ├── 📁 managers/                  # App managers
    │   │   ├── 📄 app_bottom_sheet.dart
    │   │   ├── 📄 app_dialog.dart
    │   │   └── 📄 app_toast.dart
    │   │
    │   ├── 📁 remote/                    # API & Network
    │   │   ├── 📄 api_constants.dart
    │   │   ├── 📄 api_keys.dart
    │   │   └── 📄 api_service.dart
    │   │
    │   ├── 📁 routing/                   # Navigation
    │   │   └── 📄 app_routes.dart
    │   │
    │   ├── 📁 theme/                     # UI Theme & Styling
    │   │   ├── 📄 app_colors.dart
    │   │   ├── 📄 app_dimensions.dart
    │   │   ├── 📄 app_strings.dart
    │   │   ├── 📄 app_theme.dart
    │   │   └── 📄 theme_manager.dart
    │   │
    │   ├── 📁 utils/                     # Utilities
    │   │   └── 📄 responsive_utils.dart
    │   │
    │   ├── 📁 validators/                # Form validation
    │   │   └── (validation logic)
    │   │
    │   └── 📁 widgets/                   # Reusable UI components
    │       ├── 📄 app_back_button.dart
    │       ├── 📄 app_button.dart
    │       ├── 📄 app_container.dart
    │       ├── 📄 app_icon.dart
    │       ├── 📄 app_loading.dart
    │       ├── 📄 app_spacing.dart
    │       ├── 📄 app_text_field.dart
    │       ├── 📄 app_text.dart
    │       ├── 📄 custom_app_bar.dart
    │       ├── 📄 index.dart
    │       ├── 📄 responsive_scaffold.dart
    │       ├── 📄 responsive_screen_wrapper.dart
    │       └── 📄 safe_area_wrapper.dart
    │
    ├── 📁 data/                          # Data layer
    │   ├── 📁 datasources/               # Data sources
    │   │   ├── 📄 api_client.dart
    │   │   ├── 📄 api_client.g.dart      # Generated
    │   │   ├── 📄 product_api.dart
    │   │   ├── 📄 product_api.g.dart     # Generated
    │   │   └── 📄 product_data_source.dart
    │   │
    │   ├── 📁 models/                    # Data models
    │   │   ├── 📄 cart.dart
    │   │   ├── 📄 cart.g.dart            # Generated
    │   │   ├── 📄 product.dart
    │   │   ├── 📄 product.g.dart         # Generated
    │   │   ├── 📄 user.dart
    │   │   └── 📄 user.g.dart            # Generated
    │   │
    │   └── 📁 repositories/              # Repository layer
    │       ├── 📄 cart_repository.dart
    │       └── 📄 product_repository.dart
    │
    └── 📁 presentation/                  # UI layer
        ├── 📁 features/                  # Feature modules
        │   ├── 📁 auth/                  # Authentication feature
        │   │   ├── 📁 controller/
        │   │   │   └── 📄 auth_controller.dart
        │   │   ├── 📁 screens/
        │   │   │   ├── 📄 login_screen.dart
        │   │   │   └── 📄 signup_screen.dart
        │   │   └── 📁 widgets/
        │   │       ├── 📄 login_form.dart
        │   │       └── 📄 signup_form.dart
        │   │
        │   ├── 📁 cart/                  # Cart feature
        │   │   ├── 📁 controller/
        │   │   │   └── 📄 cart_controller.dart
        │   │   ├── 📄 cart_card.dart
        │   │   └── 📄 cart_screen.dart
        │   │
        │   ├── 📁 home/                  # Home feature
        │   │   ├── 📁 controller/
        │   │   │   └── 📄 home_controller.dart
        │   │   ├── 📁 view/
        │   │   │   └── 📄 home_screen.dart
        │   │   └── 📁 widgets/
        │   │       ├── 📄 category_chips.dart
        │   │       ├── 📄 category_section.dart
        │   │       ├── 📄 home_header.dart
        │   │       ├── 📄 products_grid.dart
        │   │       ├── 📄 responsive_product_card.dart
        │   │       ├── 📄 staggered_products_grid.dart
        │   │       ├── 📄 product_card.dart
        │   │       └── 📄 products_grid.dart
        │   │
        │   ├── 📁 product/               # Product feature
        │   │   ├── 📁 controller/
        │   │   │   └── 📄 product_list_controller.dart
        │   │   ├── 📁 screens/
        │   │   │   └── 📄 product_details_screen.dart
        │   │   └── 📁 widgets/
        │   │       ├── 📄 category_chip.dart
        │   │       ├── 📄 product_card.dart
        │   │       ├── 📄 product_details_actions.dart
        │   │       ├── 📄 product_details_content.dart
        │   │       ├── 📄 product_details_header.dart
        │   │       ├── 📄 product_filter_bar.dart
        │   │       ├── 📄 product_rating_widget.dart
        │   │       └── 📄 reusable_product_image.dart
        │   │
        │   └── 📁 user/                  # User feature
        │       ├── 📄 user_card.dart
        │       └── 📄 user_screen.dart
        │
        └── 📁 shared/                    # Shared UI components
            └── (shared widgets)
```

## 🏗️ Architecture Overview

### 🏛️ Clean Architecture Pattern
```
┌─────────────────────────────────────┐
│           PRESENTATION              │  ← UI Layer (Screens, Widgets)
├─────────────────────────────────────┤
│            DOMAIN                   │  ← Business Logic (Controllers)
├─────────────────────────────────────┤
│              DATA                   │  ← Data Layer (Repositories, APIs)
└─────────────────────────────────────┘
```

### 🔧 Key Technologies Used
- **Dio** - HTTP client for API calls
- **Retrofit** - Type-safe HTTP client
- **GetIt** - Dependency injection
- **Injectable** - Code generation for DI
- **Provider** - State management
- **JSON Serialization** - Data model generation

### 📊 Data Flow
```
API (FakeStore) → Repository → Controller → UI
     ↑              ↑            ↑         ↑
  Dio/Retrofit   Business    State      Widgets
                 Logic      Management
```

### 🎨 UI Structure
- **Responsive Design** - Adapts to different screen sizes
- **Theme System** - Centralized colors, fonts, dimensions
- **Component Library** - Reusable UI widgets
- **Navigation** - Page transitions and routing

### ⚙️ Generated Files
- `*.g.dart` - JSON serialization models
- `injection.config.dart` - Dependency injection setup
- `product_api.g.dart` - Retrofit API client

## 📱 Screens & Features

### 🏠 Home Screen
- **Status Bar** - Time and signal icons
- **Welcome Header** - "Welcome Back!" with user name
- **Search Bar** - "What are you looking for..." placeholder
- **Promotional Banner** - "Shop with us!" with discount offer
- **Category Chips** - All, Jackets, Jeans, Shoes, etc.
- **Product Grid** - Responsive 2-column grid with product cards
- **Bottom Navigation** - Home, Wishlist, Notifications, Profile

### 🛍️ Product Details Screen
- **Full-screen Product Image** - Cover-fit product image
- **Header Actions** - Back, favorite, and cart icons
- **Swipe Up Indicator** - "Swipe up for details" with dots
- **Bottom Action Bar** - Price and "Continue →" button

### 🛒 Cart Screen
- **Cart Items List** - Product images, names, prices
- **Quantity Controls** - Plus/minus buttons for quantity
- **Size Indicators** - L, M, XL size badges
- **Remove Buttons** - Trash icons for item removal
- **Order Summary** - Subtotal, Shipping, Total
- **Checkout Button** - "Checkout →" action button

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.2.3 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation
1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd taskaia
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code files**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Desktop (Windows, macOS, Linux)

## 🔧 Development

### Code Generation
The project uses code generation for:
- **JSON Serialization** - Data models
- **Dependency Injection** - Service registration
- **Retrofit** - API client generation

Run code generation after changes:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### API Integration
- **Base URL**: `https://fakestoreapi.com`
- **Endpoints**:
  - Products: `/products`
  - Categories: `/products/categories`
  - Cart: `/carts`
  - Users: `/users`

### State Management
- **Provider Pattern** - For reactive UI updates
- **Controllers** - Business logic and state management
- **Repositories** - Data access layer

## 🎯 Best Practices Implemented

### ✅ Code Quality
- **Clean Architecture** - Proper separation of concerns
- **Dependency Injection** - Loose coupling and testability
- **Type Safety** - Strong typing throughout the app
- **Error Handling** - Comprehensive error management
- **Loading States** - Proper loading indicators

### ✅ Performance
- **Efficient Widgets** - Minimal rebuilds
- **Image Optimization** - Proper image loading and caching
- **Memory Management** - Proper disposal patterns
- **Responsive Design** - Optimized for all screen sizes

### ✅ Maintainability
- **Centralized Theme** - Easy to modify and extend
- **Custom Widgets** - Consistent styling and behavior
- **Clear Structure** - Well-organized codebase
- **Documentation** - Comprehensive documentation

## 🎨 Design System

### Colors
```dart
// Primary colors
AppColors.primary
AppColors.accentYellow

// Text colors
AppColors.textPrimary
AppColors.textSecondary
AppColors.textLight

// UI colors
AppColors.background
AppColors.white
AppColors.cardBackground
```

### Dimensions
```dart
// Spacing
AppDimensions.spacing8
AppDimensions.spacing16
AppDimensions.spacing24

// Font sizes
AppDimensions.fontSmall
AppDimensions.fontMedium
AppDimensions.fontLarge
```

### Typography
```dart
// Text styles
TextStyle(
  fontSize: AppDimensions.fontLarge,
  fontWeight: FontWeight.bold,
  color: AppColors.textPrimary,
)
```

## 🚀 Future Enhancements

- [ ] **User Authentication** - Login/signup functionality +validation
- [ ] **Payment Integration** - Stripe/PayPal integration
- [ ] **Offline Support** - Local caching and offline mode
- [ ] **Push Notifications** - Order updates and promotions
- [ ] **Advanced Search** - Filters and search functionality
- [ ] **Wishlist** - Save favorite products
- [ ] **Order History** - Track past orders
- [ ] **User Reviews** - Product ratings and reviews
- [ ] **Multi-language** - Internationalization support
- [ ] **Dark Mode** - Complete dark theme implementation

## 📈 Performance Metrics

- **App Size**: Optimized bundle size
- **Load Time**: Fast initial load
- **Memory Usage**: Efficient memory management
- **Battery Usage**: Optimized for mobile devices
- **Network**: Efficient API calls with caching

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

