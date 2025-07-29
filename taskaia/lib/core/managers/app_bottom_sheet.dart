import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../utils/responsive_utils.dart';

class AppBottomSheet {
  static void showConfirmationSheet(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmText,
    required String cancelText,
    required VoidCallback onConfirm,
    VoidCallback? onCancel,
    Color? confirmColor,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => _ConfirmationBottomSheet(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
        onCancel: onCancel ?? () => Navigator.of(context).pop(),
        confirmColor: confirmColor ?? AppColors.warningRed,
      ),
    );
  }
}

class _ConfirmationBottomSheet extends StatefulWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final Color confirmColor;

  const _ConfirmationBottomSheet({
    required this.title,
    required this.message,
    required this.confirmText,
    required this.cancelText,
    required this.onConfirm,
    required this.onCancel,
    required this.confirmColor,
  });

  @override
  State<_ConfirmationBottomSheet> createState() =>
      _ConfirmationBottomSheetState();
}

class _ConfirmationBottomSheetState extends State<_ConfirmationBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
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
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.bottomSheetBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppDimensions.radiusXLarge),
            topRight: Radius.circular(AppDimensions.radiusXLarge),
          ),
        ),
        padding: EdgeInsets.all(AppDimensions.paddingLarge),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: AppDimensions.bottomSheetHandleWidth,
              height: AppDimensions.bottomSheetHandleHeight,
              decoration: BoxDecoration(
                color: AppColors.handleBar,
                borderRadius: BorderRadius.circular(AppDimensions.radiusSmall / 4),
              ),
            ),
            SizedBox(height: AppDimensions.spacing24),

            // Warning icon
            Container(
              width: AppDimensions.dialogIconSize,
              height: AppDimensions.dialogIconSize,
              decoration: BoxDecoration(
                color: widget.confirmColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.warning_outlined,
                color: widget.confirmColor,
                size: AppDimensions.iconLarge,
              ),
            ),
            SizedBox(height: AppDimensions.spacing16),

            // Title
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
            SizedBox(height: AppDimensions.spacing8),

            // Message
            Text(
              widget.message,
              style: TextStyle(
                fontSize: ResponsiveUtils.getResponsiveFontSize(
                  context,
                  AppDimensions.fontLarge,
                ),
                color: AppColors.textSecondary,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.spacing32),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: ResponsiveUtils.getButtonHeight(context),
                    child: OutlinedButton(
                      onPressed: widget.onCancel,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: AppColors.greyMedium,
                        ), // Changed from Colors.grey
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                        ),
                      ),
                      child: Text(
                        widget.cancelText,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: ResponsiveUtils.getResponsiveFontSize(
                            context,
                            AppDimensions.fontLarge,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppDimensions.spacing16),
                Expanded(
                  child: SizedBox(
                    height: ResponsiveUtils.getButtonHeight(context),
                    child: ElevatedButton(
                      onPressed: widget.onConfirm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.confirmColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                        ),
                      ),
                      child: Text(
                        widget.confirmText,
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
                ),
              ],
            ),

            // Safe area bottom padding
            SizedBox(height: ResponsiveUtils.getSafeAreaPadding(context).bottom),
          ],
        ),
      ),
    );
  }
}
