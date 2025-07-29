import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../utils/responsive_utils.dart';

class AppDialog {
  static void showInstructionDialog(
    BuildContext context, {
    required String title,
    required String content,
    String? buttonText,
    VoidCallback? onPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColors.dialogOverlay,
      builder: (context) => _InstructionDialog(
        title: title,
        content: content,
        buttonText: buttonText ?? 'Got it!',
        onPressed: onPressed ?? () => Navigator.of(context).pop(),
      ),
    );
  }
}

class _InstructionDialog extends StatefulWidget {
  final String title;
  final String content;
  final String buttonText;
  final VoidCallback onPressed;

  const _InstructionDialog({
    required this.title,
    required this.content,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  State<_InstructionDialog> createState() => _InstructionDialogState();
}

class _InstructionDialogState extends State<_InstructionDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusLarge),
          ),
          contentPadding: EdgeInsets.all(AppDimensions.paddingLarge),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: AppDimensions.dialogIconSize,
                height: AppDimensions.dialogIconSize,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.info_outline,
                  color: AppColors.primary,
                  size: AppDimensions.iconLarge,
                ),
              ),
              SizedBox(height: AppDimensions.spacing16),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: ResponsiveUtils.getResponsiveFontSize(
                    context,
                    AppDimensions.fontXXLarge,
                  ),
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.spacing12),
              Text(
                widget.content,
                style: TextStyle(
                  fontSize: ResponsiveUtils.getResponsiveFontSize(
                    context,
                    AppDimensions.fontLarge,
                  ),
                  color: Colors.black87,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppDimensions.spacing24),
              SizedBox(
                width: double.infinity,
                height: ResponsiveUtils.getButtonHeight(context),
                child: ElevatedButton(
                  onPressed: widget.onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                    ),
                  ),
                  child: Text(
                    widget.buttonText,
                    style: TextStyle(
                      color: AppColors.textOnPrimary,
                      fontSize: ResponsiveUtils.getResponsiveFontSize(
                        context,
                        AppDimensions.fontLarge,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}