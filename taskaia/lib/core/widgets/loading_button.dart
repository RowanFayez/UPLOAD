// import 'package:flutter/material.dart';
// import '../theme/app_colors.dart';

// class LoadingButton extends StatelessWidget {
//   final String text;
//   final VoidCallback? onPressed;
//   final bool isLoading;
//   final Color? backgroundColor;
//   final Color? textColor;
//   final double height;
//   final double borderRadius;
//   final Widget? icon;

//   const LoadingButton({
//     super.key,
//     required this.text,
//     this.onPressed,
//     this.isLoading = false,
//     this.backgroundColor,
//     this.textColor,
//     this.height = 50,
//     this.borderRadius = 12,
//     this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: height,
//       child: ElevatedButton(
//         onPressed: isLoading ? null : onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: backgroundColor ?? AppColors.primary,
//           disabledBackgroundColor: (backgroundColor ?? AppColors.primary)
//               .withOpacity(0.6),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(borderRadius),
//           ),
//           elevation: 0,
//         ),
//         child: isLoading
//             ? SizedBox(
//                 width: 20,
//                 height: 20,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                   valueColor: AlwaysStoppedAnimation<Color>(
//                     textColor ?? AppColors.white,
//                   ),
//                 ),
//               )
//             : Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   if (icon != null) ...[icon!, const SizedBox(width: 8)],
//                   Text(
//                     text,
//                     style: TextStyle(
//                       color: textColor ?? AppColors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }
