// import 'package:flutter/material.dart';

// class ResponsiveUtils {
//   static double getScreenWidth(BuildContext context) =>
//       MediaQuery.of(context).size.width;

//   static double getScreenHeight(BuildContext context) =>
//       MediaQuery.of(context).size.height;

//   static bool isMobile(BuildContext context) => getScreenWidth(context) < 600;
//   static bool isTablet(BuildContext context) =>
//       getScreenWidth(context) >= 600 && getScreenWidth(context) < 1024;
//   static bool isDesktop(BuildContext context) =>
//       getScreenWidth(context) >= 1024;

//   static EdgeInsets getScreenPadding(BuildContext context) {
//     final width = getScreenWidth(context);
//     if (width < 600) return const EdgeInsets.all(16);
//     if (width < 1024) return const EdgeInsets.all(24);
//     return const EdgeInsets.all(32);
//   }

//   static double getContentMaxWidth(BuildContext context) {
//     final width = getScreenWidth(context);
//     if (width > 1200) return 800;
//     return width * 0.9;
//   }
// }
