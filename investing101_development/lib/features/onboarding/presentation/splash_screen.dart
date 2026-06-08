import 'package:flutter/material.dart';
import 'dart:async';

import 'package:investing101/features/onboarding/presentation/login_screen.dart';
import 'package:investing101/shared/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to home page after 1 second
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

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

class GridBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
          .withOpacity(0.1) // Very subtle grey
      ..strokeWidth = 1.0;

    const gridSize = 40.0; // Size of each grid square

    // Draw vertical lines
    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
