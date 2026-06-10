import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:investing101_development/core/theme/colors.dart';

/// Shared layout for onboarding screens that show a speech bubble,
/// a character image, and a primary action button pinned to the bottom.
class OnboardingMessageScreen extends StatelessWidget {
  const OnboardingMessageScreen({
    super.key,
    required this.bubbleText,
    required this.characterAsset,
    required this.buttonText,
    required this.onButtonTap,
  });

  final String bubbleText;
  final String characterAsset;
  final String buttonText;
  final VoidCallback onButtonTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _SpeechBubble(text: bubbleText),
                  const SizedBox(height: 24),
                  Image.asset(characterAsset, width: 180, height: 168),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: _ThreeDButton(label: buttonText, onTap: onButtonTap),
            ),
          ],
        ),
      ),
    );
  }
}

class _SpeechBubble extends StatelessWidget {
  const _SpeechBubble({required this.text});

  final String text;

  static const _borderColor = Color(0xFFD4DBDE);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: _borderColor, width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'TmoneyRoundWind',
                fontWeight: FontWeight.w800,
                fontSize: 14,
                height: 20 / 14,
                letterSpacing: -0.42,
                color: Color(0xFF161F22),
              ),
            ),
          ),
          // Downward arrow pointer
          Positioned(
            bottom: -9,
            child: Transform.rotate(
              angle: 135 * math.pi / 180,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: _borderColor, width: 2),
                    right: BorderSide(color: _borderColor, width: 2),
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

class _ThreeDButton extends StatelessWidget {
  const _ThreeDButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF4A40E9),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontFamily: 'TmoneyRoundWind',
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      height: 22 / 15,
                      letterSpacing: -0.45,
                      color: Colors.white,
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
