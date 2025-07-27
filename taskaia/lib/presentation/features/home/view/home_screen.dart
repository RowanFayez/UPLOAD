import 'package:flutter/material.dart';
import 'package:taskaia/core/animation/slide_transition_wrapper.dart';
import 'package:taskaia/core/managers/alert_manager.dart';
import '../../../../core/theme/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _tramController;
  late Animation<Offset> _tramAnimation;

  @override
  void initState() {
    super.initState();
    _tramController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: false);

    _tramAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: const Offset(1.5, 0),
    ).animate(CurvedAnimation(parent: _tramController, curve: Curves.linear));
  }

  @override
  void dispose() {
    _tramController.dispose();
    super.dispose();
  }

  void _onLogoutPressed() {
    AlertManager.showLogoutConfirmation(context, () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransitionWrapper(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(AppStrings.homeTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _onLogoutPressed,
            ),
          ],
        ),
        body: Stack(
          children: [
            const Center(child: Text(AppStrings.homeWelcome)),
            SlideTransition(
              position: _tramAnimation,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Image.asset('lib/assets/tram.png', width: 120),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
