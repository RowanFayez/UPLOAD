# Taskaia - Alexandria Tram Guide

A modern, responsive Flutter application for exploring Alexandria's tram system and furniture products.

## 🚀 Features

### ✅ Clean Architecture
- **No Hard-coded Values**: All colors, strings, and dimensions are centralized in the `core/theme` directory
- **Responsive Design**: Works perfectly on all screen sizes (mobile, tablet, desktop)
- **Safe Area Support**: Proper handling of device notches and system UI
- **Custom Widgets**: Reusable, customizable components

### 🎨 Design System
- **AppColors**: Centralized color management with dark/light theme support
- **AppDimensions**: Consistent spacing, sizing, and typography
- **AppStrings**: Localized text management
- **ResponsiveUtils**: Smart responsive design utilities

### 📱 Responsive Components

#### Custom Widgets
- **AppButton**: Fully customizable button with loading states, icons, and outlined variants
- **AppTextField**: Advanced text field with validation, icons, and error handling
- **ResponsiveScaffold**: Scaffold with built-in safe area and responsive padding
- **SafeAreaWrapper**: Flexible safe area wrapper with custom padding
- **ResponsiveScreenWrapper**: Screen wrapper for responsive layouts

#### Responsive Features
- **Grid System**: Adaptive grid that adjusts columns based on screen size
- **Typography**: Responsive font sizes that scale with screen size
- **Spacing**: Dynamic spacing that adapts to different devices
- **Icons**: Responsive icon sizes for better visual hierarchy

### 🏗️ Architecture

```
lib/
├── core/
│   ├── animation/          # Page transitions and animations
│   ├── managers/           # Dialog, toast, and bottom sheet managers
│   ├── routing/            # Navigation and routing
│   ├── theme/              # Colors, dimensions, strings, and theme management
│   ├── utils/              # Responsive utilities and helpers
│   └── widgets/            # Reusable custom widgets
├── data/
│   ├── datasources/        # Data sources
│   ├── models/             # Data models
│   └── repositories/       # Repository pattern implementation
└── presentation/
    └── features/
        ├── auth/           # Authentication screens and widgets
        ├── home/           # Home screen and related widgets
        └── product/        # Product details and related widgets
```

### 🎯 Key Improvements

#### ✅ Clean Code
- **No Hard-coded Values**: All colors, strings, and dimensions use centralized constants
- **Consistent Naming**: Clear, descriptive naming conventions
- **Separation of Concerns**: Proper separation between UI, business logic, and data layers

#### ✅ Responsive Design
- **Mobile-First**: Optimized for mobile devices with tablet and desktop support
- **Adaptive Layouts**: Grids and layouts that adjust to screen size
- **Safe Area**: Proper handling of device-specific UI elements
- **Touch-Friendly**: Appropriate touch targets and spacing

#### ✅ Layout Issues Fixed
- **Overflow Prevention**: Fixed "BOTTOM OVERFLOWED BY 6.0 PIXELS" error in ProductCard
- **Hero Transition**: Improved Hero animation with consistent aspect ratios
- **Grid Layout**: Enhanced grid system with better spacing and proportions
- **Image Consistency**: Fixed aspect ratios for consistent image display

#### ✅ Maintainable
- **Modular Architecture**: Easy to modify and extend
- **Reusable Components**: Custom widgets that can be used throughout the app
- **Theme System**: Easy to change colors and styling globally
- **Documentation**: Clear code comments and structure

#### ✅ Professional
- **Best Practices**: Follows Flutter and Dart best practices
- **Performance**: Optimized for smooth performance
- **Accessibility**: Proper semantic structure and accessibility support
- **Error Handling**: Comprehensive error handling and user feedback

### 🛠️ Custom Widgets

#### AppButton
```dart
AppButton(
  label: 'Login',
  onPressed: () => handleLogin(),
  isLoading: false,
  isFullWidth: true,
  icon: Icons.login,
  isOutlined: false,
)
```

#### AppTextField
```dart
AppTextField(
  label: 'Email',
  hint: 'Enter your email',
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  isRequired: true,
  prefixIcon: Icon(Icons.email_outlined),
)
```

#### ResponsiveScaffold
```dart
ResponsiveScaffold(
  backgroundColor: AppColors.background,
  useSafeArea: true,
  appBar: AppBar(title: Text('Home')),
  body: YourContent(),
)
```

#### StaggeredProductsGrid
```dart
StaggeredProductsGrid(
  products: products,
  onProductTap: (product) => navigateToDetails(product),
)
```

### 📐 Responsive Breakpoints

- **Mobile**: < 600px (2 columns grid)
- **Tablet**: 600px - 1024px (3 columns grid)
- **Desktop**: > 1024px (4 columns grid)

### 🎨 Theme System

#### Colors
- Primary colors with dark/light variants
- Semantic colors (success, warning, error)
- UI component colors
- Text colors with proper contrast

#### Dimensions
- Consistent spacing system
- Responsive typography
- Adaptive icon sizes
- Flexible border radius values

### 🔧 Layout Improvements

#### ProductCard Enhancements
- **Fixed Aspect Ratio**: Consistent 1:1 aspect ratio for images
- **Overflow Prevention**: Removed fixed height constraints
- **Responsive Content**: Dynamic content sizing
- **Better Spacing**: Improved internal spacing and padding

#### Hero Transition Fixes
- **Consistent Sizing**: Matching aspect ratios between source and destination
- **Smooth Animation**: Improved transition smoothness
- **Proper Positioning**: Better positioning in destination screen
- **Responsive Margins**: Dynamic margins based on screen size

#### Grid System Improvements
- **Adaptive Columns**: Dynamic column count based on screen size
- **Better Spacing**: Responsive spacing between grid items
- **Flexible Heights**: Cards adapt to content height
- **Consistent Layout**: Uniform appearance across devices

### 🚀 Getting Started

1. **Clone the repository**
2. **Install dependencies**: `flutter pub get`
3. **Run the app**: `flutter run`

### 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Desktop (Windows, macOS, Linux)

### 🔧 Development

The app follows a clean architecture pattern with:
- **Presentation Layer**: UI components and screens
- **Domain Layer**: Business logic and use cases
- **Data Layer**: Data sources and repositories

### 📈 Performance

- **Optimized Images**: Proper image loading and caching
- **Efficient Widgets**: Minimal rebuilds and optimized rendering
- **Memory Management**: Proper disposal of controllers and listeners
- **Smooth Animations**: Optimized Hero transitions and page animations

### 🎯 Future Enhancements

- [ ] Staggered Grid View implementation for Pinterest-like layout
- [ ] Internationalization (i18n) support
- [ ] Advanced animations and micro-interactions
- [ ] Offline support with local caching
- [ ] Push notifications
- [ ] Advanced search and filtering
- [ ] User preferences and settings

---

**Built with ❤️ using Flutter**
