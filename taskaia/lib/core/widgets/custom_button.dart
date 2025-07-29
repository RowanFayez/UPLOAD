import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../utils/responsive_utils.dart';

enum ButtonSize { small, medium, large, xLarge }
enum ButtonType { primary, secondary, outline, text }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonSize size;
  final ButtonType type;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final bool isFullWidth;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.size = ButtonSize.medium,
    this.type = ButtonType.primary,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      height: _getButtonHeight(context),
      child: _buildButton(context, isDark),
    );
  }

  double _getButtonHeight(BuildContext context) {
    switch (size) {
      case ButtonSize.small:
        return ResponsiveUtils.getResponsiveSpacing(
          context, 
          AppDimensions.buttonHeightSmall,
        );
      case ButtonSize.medium:
        return ResponsiveUtils.getResponsiveSpacing(
          context, 
          AppDimensions.buttonHeightMedium,
        );
      case ButtonSize.large:
        return ResponsiveUtils.getResponsiveSpacing(
          context, 
          AppDimensions.buttonHeightLarge,
        );
      case ButtonSize.xLarge:
        return ResponsiveUtils.getResponsiveSpacing(
          context, 
          AppDimensions.buttonHeightXLarge,
        );
    }
  }

  Widget _buildButton(BuildContext context, bool isDark) {
    switch (type) {
      case ButtonType.primary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: _getElevatedButtonStyle(isDark),
          child: _buildButtonContent(context),
        );
      case ButtonType.secondary:
        return ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: _getSecondaryButtonStyle(isDark),
          child: _buildButtonContent(context),
        );
      case ButtonType.outline:
        return OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: _getOutlinedButtonStyle(isDark),
          child: _buildButtonContent(context),
        );
      case ButtonType.text:
        return TextButton(
          onPressed: isLoading ? null : onPressed,
          style: _getTextButtonStyle(),
          child: _buildButtonContent(context),
        );
    }
  }

  Widget _buildButtonContent(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: AppDimensions.spacing20,
        height: AppDimensions.spacing20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(
            _getLoadingColor(),
          ),
        ),
      );
    }

    final List<Widget> children = [];
    
    if (icon != null) {
      children.add(icon!);
      children.add(SizedBox(width: AppDimensions.spacing8));
    }
    
    children.add(
      Text(
        text,
        style: TextStyle(
          color: _getTextColor(),
          fontSize: ResponsiveUtils.getResponsiveFontSize(
            context,
            _getFontSize(),
          ),
          fontWeight: FontWeight.w600,
        ),
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }

  ButtonStyle _getElevatedButtonStyle(bool isDark) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? AppColors.primary,
      disabledBackgroundColor: (backgroundColor ?? AppColors.primary)
          .withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      elevation: AppDimensions.elevationLow,
    );
  }

  ButtonStyle _getSecondaryButtonStyle(bool isDark) {
    return ElevatedButton.styleFrom(
      backgroundColor: isDark ? AppColors.darkCard : AppColors.greyLight,
      disabledBackgroundColor: AppColors.greyMedium.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
      elevation: AppDimensions.elevationLow,
    );
  }

  ButtonStyle _getOutlinedButtonStyle(bool isDark) {
    return OutlinedButton.styleFrom(
      side: BorderSide(
        color: backgroundColor ?? AppColors.primary,
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
    );
  }

  ButtonStyle _getTextButtonStyle() {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      ),
    );
  }

  Color _getTextColor() {
    switch (type) {
      case ButtonType.primary:
        return textColor ?? AppColors.textOnPrimary;
      case ButtonType.secondary:
        return textColor ?? AppColors.textPrimary;
      case ButtonType.outline:
        return textColor ?? (backgroundColor ?? AppColors.primary);
      case ButtonType.text:
        return textColor ?? AppColors.primary;
    }
  }

  Color _getLoadingColor() {
    switch (type) {
      case ButtonType.primary:
        return AppColors.textOnPrimary;
      case ButtonType.secondary:
        return AppColors.textPrimary;
      case ButtonType.outline:
        return backgroundColor ?? AppColors.primary;
      case ButtonType.text:
        return AppColors.primary;
    }
  }

  double _getFontSize() {
    switch (size) {
      case ButtonSize.small:
        return AppDimensions.fontMedium;
      case ButtonSize.medium:
        return AppDimensions.fontLarge;
      case ButtonSize.large:
        return AppDimensions.fontXLarge;
      case ButtonSize.xLarge:
        return AppDimensions.fontXXLarge;
    }
  }
}