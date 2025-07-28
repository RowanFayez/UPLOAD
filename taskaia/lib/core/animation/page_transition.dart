import 'package:flutter/material.dart';

class PageTransitions {
  static Route<T> slideTransition<T extends Object?>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    Offset begin = const Offset(1.0, 0.0),
    Offset end = Offset.zero,
    Curve curve = Curves.easeInOut,
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final slideAnimation = Tween<Offset>(
          begin: begin,
          end: end,
        ).animate(CurvedAnimation(parent: animation, curve: curve));

        return SlideTransition(position: slideAnimation, child: child);
      },
    );
  }

  static Route<T> fadeTransition<T extends Object?>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final fadeAnimation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(CurvedAnimation(parent: animation, curve: curve));

        return FadeTransition(opacity: fadeAnimation, child: child);
      },
    );
  }

  static Route<T> scaleTransition<T extends Object?>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    double begin = 0.8,
    double end = 1.0,
    Curve curve = Curves.easeOutBack,
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final scaleAnimation = Tween<double>(
          begin: begin,
          end: end,
        ).animate(CurvedAnimation(parent: animation, curve: curve));

        return ScaleTransition(scale: scaleAnimation, child: child);
      },
    );
  }
}
