import 'package:flutter/material.dart';
import '../theme/app_dimensions.dart';
import '../utils/responsive_utils.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  final bool useSafeArea;
  final bool centerContent;
  final EdgeInsets? customPadding;
  final double? maxWidth;

  const ResponsiveWrapper({
    super.key,
    required this.child,
    this.useSafeArea = true,
    this.centerContent = false,
    this.customPadding,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth ?? ResponsiveUtils.getContentMaxWidth(context),
      ),
      child: child,
    );

    if (centerContent) {
      content = Center(child: content);
    }

    if (useSafeArea) {
      content = SafeArea(
        child: Padding(
          padding: customPadding ?? ResponsiveUtils.getScreenPadding(context),
          child: content,
        ),
      );
    }

    return content;
  }
}

class ResponsiveScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Color? backgroundColor;
  final bool useSafeArea;
  final EdgeInsets? bodyPadding;

  const ResponsiveScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.drawer,
    this.backgroundColor,
    this.useSafeArea = true,
    this.bodyPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: ResponsiveWrapper(
        useSafeArea: useSafeArea,
        customPadding: bodyPadding,
        child: body,
      ),
    );
  }
}