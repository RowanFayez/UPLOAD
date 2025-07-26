import 'package:flutter/material.dart';

class SlideTransitionWrapper extends StatefulWidget {
  final Widget child;
  const SlideTransitionWrapper({super.key, required this.child});

  @override
  State<SlideTransitionWrapper> createState() => _SlideTransitionWrapperState();
}

class _SlideTransitionWrapperState extends State<SlideTransitionWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: widget.child);
  }
}
