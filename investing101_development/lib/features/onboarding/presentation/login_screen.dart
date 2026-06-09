import 'package:flutter/material.dart';
import 'package:investing101_development/features/onboarding/presentation/splash_screen.dart';
import 'package:investing101_development/shared/theme/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: CustomPaint(
        painter: GridBackgroundPainter(),
        child: Center(
          child: Text(
            'Investing 101',
            style: TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: AppColors.textOnPrimary, // Deep blue color
              letterSpacing: 0,
            ),
          ),
        ),
      ),
    );
  }
}
