// import 'package:flutter/material.dart';
// import '../utils/responsive_utils.dart';
// import 'safe_area_wrapper.dart';

// class ResponsiveScreenWrapper extends StatelessWidget {
//   final Widget child;
//   final bool useSafeArea;
//   final bool centerContent;
//   final EdgeInsets? customPadding;

//   const ResponsiveScreenWrapper({
//     super.key,
//     required this.child,
//     this.useSafeArea = true,
//     this.centerContent = false,
//     this.customPadding,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Widget content = ConstrainedBox(
//       constraints: BoxConstraints(
//         maxWidth: ResponsiveUtils.getContentMaxWidth(context),
//       ),
//       child: child,
//     );

//     if (centerContent) {
//       content = Center(child: content);
//     }

//     if (useSafeArea) {
//       content = SafeAreaWrapper(customPadding: customPadding, child: content);
//     }

//     return content;
//   }
// }
