import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investing101_development/features/onboarding/presentation/home_widget_test.dart';
import 'package:investing101_development/shared/theme/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeWidgetTest()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SizedBox(
          width: 240,
          height: 32,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/logo_icon.svg',
                width: 39,
                height: 32,
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(
                'assets/images/logo_text.svg',
                height: 21,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
