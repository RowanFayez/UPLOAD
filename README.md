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
- **AppText**: Responsive text widget with predefined styles
- **AppSpacing**: Consistent spacing and padding widgets
- **AppContainer**: Flexible container with predefined styles
- **AppIcon**: Responsive icon widget with button variants
- **AppLoading**: Loading indicators and overlays
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
│       ├── app_button.dart
│       ├── app_text_field.dart
│       ├── app_text.dart
│       ├── app_spacing.dart
│       ├── app_container.dart
│       ├── app_icon.dart
│       ├── app_loading.dart
│       ├── responsive_scaffold.dart
│       ├── safe_area_wrapper.dart
│       ├── responsive_screen_wrapper.dart
│       ├── custom_app_bar.dart
│       └── index.dart
├── data/
│   ├── datasources/        # Data sources
│   ├── models/             # Data models
│   └── repositories/       # Data repositories
└── presentation/
    └── features/           # Feature-based UI components
        ├── auth/           # Authentication screens
        ├── home/           # Home screen and related widgets
        └── product/        # Product-related screens and widgets
```

### 🎯 Key Improvements

#### ✅ Fixed Issues
- **Eliminated Hard-coded Values**: All hard-coded colors, dimensions, and strings removed
- **Consistent ResponsiveUtils Usage**: All components now use ResponsiveUtils properly
- **ResponsiveScaffold Implementation**: All screens use ResponsiveScaffold instead of regular Scaffold
- **Proper AppDimensions Usage**: All spacing and sizing uses AppDimensions constants

#### 🆕 New Custom Widgets

##### **AppText & Typography**
```dart
// Basic text with responsive font size
AppText('Hello World', style: TextStyle(fontSize: AppDimensions.fontLarge))

// Predefined heading styles
AppHeading('Main Title')
AppHeading.h1('Large Heading')
AppHeading.h2('Medium Heading')
AppHeading.h3('Small Heading')

// Body text with variants
AppBodyText('Regular body text')
AppBodyText.primary('Primary text')
AppBodyText.secondary('Secondary text')
```

##### **AppSpacing & Layout**
```dart
// Responsive spacing
AppSpacing.small()  // 8px
AppSpacing.medium() // 16px
AppSpacing.large()  // 24px
AppSpacing.xlarge() // 32px

// Responsive padding
AppPadding.small(child: YourWidget())
AppPadding.medium(child: YourWidget())
AppPadding.large(child: YourWidget())
AppPadding.horizontal(child: YourWidget())
AppPadding.vertical(child: YourWidget())
```

##### **AppContainer & Cards**
```dart
// Flexible container
AppContainer(
  child: YourWidget(),
  borderRadius: AppDimensions.radiusLarge,
  boxShadow: [BoxShadow(...)],
)

// Predefined card styles
AppCard.small(child: YourWidget())
AppCard.medium(child: YourWidget())
AppCard.large(child: YourWidget())

// Container variants
AppContainer.card(child: YourWidget())
AppContainer.elevated(child: YourWidget())
AppContainer.outlined(child: YourWidget())
AppContainer.rounded(child: YourWidget())
```

##### **AppIcon & Icon Buttons**
```dart
// Responsive icons
AppIcon.small(Icons.star)
AppIcon.medium(Icons.favorite)
AppIcon.large(Icons.home)
AppIcon.xlarge(Icons.settings)

// Icon buttons
AppIconButton.small(Icons.edit, onPressed: () {})
AppIconButton.medium(Icons.delete, onPressed: () {})
AppIconButton.large(Icons.add, onPressed: () {})
AppIconButton.circular(Icons.close, onPressed: () {})
```

##### **AppLoading & Loading States**
```dart
// Loading indicators
AppLoading.small()
AppLoading.medium()
AppLoading.large()
AppLoading.xlarge()

// Loading with message
AppLoading.large(message: 'Loading...', showMessage: true)

// Loading overlay
AppLoadingOverlay(
  child: YourWidget(),
  isLoading: true,
  message: 'Processing...',
)

// Loading button
AppLoadingButton(
  label: 'Submit',
  onPressed: () {},
  isLoading: true,
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

### 🎯 Best Practices Implemented

#### ✅ Code Quality
- **No Hard-coded Values**: All constants centralized
- **Responsive Design**: Consistent across all screen sizes
- **Custom Widgets**: Reusable and maintainable
- **Clean Architecture**: Proper separation of concerns
- **Type Safety**: Strong typing throughout the app

#### ✅ Performance
- **ResponsiveUtils**: Optimized responsive calculations
- **Custom Widgets**: Minimal rebuilds
- **Efficient Layouts**: Proper use of constraints
- **Memory Management**: Proper disposal patterns

#### ✅ Maintainability
- **Centralized Theme**: Easy to modify and extend
- **Custom Widgets**: Consistent styling and behavior
- **Clear Structure**: Well-organized codebase
- **Documentation**: Comprehensive documentation

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
