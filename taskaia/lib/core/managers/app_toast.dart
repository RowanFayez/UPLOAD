import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../utils/responsive_utils.dart';

class AppToast {
  static void showSuccess(
    BuildContext context,
    String message, {
    String? subtitle,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => _ToastWidget(
        message: message,
        subtitle: subtitle,
        icon: Icons.check_circle,
        color: AppColors.successGreen,
        onDismiss: () => overlayEntry.remove(),
      ),
    );

    overlay.insert(overlayEntry);

    // Auto dismiss after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}

class _ToastWidget extends StatefulWidget {
  final String message;
  final String? subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onDismiss;

  const _ToastWidget({
    required this.message,
    this.subtitle,
    required this.icon,
    required this.color,
    required this.onDismiss,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
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
    return Positioned(
      top: ResponsiveUtils.getSafeAreaPadding(context).top + AppDimensions.spacing16,
      left: AppDimensions.spacing16,
      right: AppDimensions.spacing16,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(AppDimensions.paddingMedium),
              decoration: BoxDecoration(
                color: AppColors.toastBackground,
                borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: AppDimensions.blurRadiusSmall,
                    offset: Offset(0, AppDimensions.elevationLow),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    widget.icon, 
                    color: widget.color, 
                    size: AppDimensions.toastIconSize,
                  ),
                  SizedBox(width: AppDimensions.spacing12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.message,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: ResponsiveUtils.getResponsiveFontSize(
                              context,
                              AppDimensions.fontLarge,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (widget.subtitle != null) ...[
                          SizedBox(height: AppDimensions.spacing4),
                          Opacity(
                            opacity: 0.8,
                            child: Text(
                              widget.subtitle!,
                              style: TextStyle(
                                color: AppColors.textOnPrimary,
                                fontSize: ResponsiveUtils.getResponsiveFontSize(
                                  context,
                                  AppDimensions.fontMedium,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onDismiss,
                    child: const Icon(
                      Icons.close,
                      color: AppColors.textOnPrimary,
                      size: AppDimensions.iconSmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
