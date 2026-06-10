import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/core/theme/colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _HeadingSection(),
              const SizedBox(height: 32),
              const _CharacterSection(),
              const SizedBox(height: 20),
              const _ButtonSection(),
              const SizedBox(height: 56),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeadingSection extends StatelessWidget {
  const _HeadingSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '투자를 전문적으로\n재미있게 학습하세요',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'TmoneyRoundWind',
            fontWeight: FontWeight.w800,
            fontSize: 22,
            height: 30 / 22,
            letterSpacing: -0.66,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '영원히 무료입니다',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'TmoneyRoundWind',
            fontWeight: FontWeight.w800,
            fontSize: 17,
            height: 24 / 17,
            letterSpacing: -0.51,
            color: const Color(0xFF7D909C),
          ),
        ),
      ],
    );
  }
}

class _CharacterSection extends StatelessWidget {
  const _CharacterSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/onb_character.png',
        width: 120,
        height: 120,
      ),
    );
  }
}

class _ButtonSection extends StatelessWidget {
  const _ButtonSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ThreeDButton(
          label: '시작하기',
          backgroundColor: AppColors.primary,
          shadowColor: AppColors.shadowOnPrimary,
          textColor: Colors.white,
          shadowOffset: 4,
          onTap: () {
            Get.toNamed(Routes.welcome);
          },
        ),
        const SizedBox(height: 12),
        _ThreeDButton(
          label: '이미 계정이 있어요',
          backgroundColor: Colors.white,
          shadowColor: AppColors.shadowOnSurface,
          textColor: AppColors.primary,
          shadowOffset: 3,
          borderColor: AppColors.shadowOnSurface,
          onTap: () {
            Get.toNamed(Routes.welcome);
          },
        ),
      ],
    );
  }
}

class _ThreeDButton extends StatelessWidget {
  const _ThreeDButton({
    required this.label,
    required this.backgroundColor,
    required this.shadowColor,
    required this.textColor,
    required this.shadowOffset,
    required this.onTap,
    this.borderColor,
  });

  final String label;
  final Color backgroundColor;
  final Color shadowColor;
  final Color textColor;
  final double shadowOffset;
  final VoidCallback onTap;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48 + shadowOffset,
      child: Stack(
        children: [
          // 3D shadow layer
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: shadowColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          // Button surface
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: borderColor != null
                      ? Border.all(color: borderColor!, width: 2)
                      : null,
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWind',
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      height: 22 / 15,
                      letterSpacing: -0.45,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
