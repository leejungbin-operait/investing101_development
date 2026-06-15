import 'package:flutter/material.dart';
import 'package:investing101_development/core/theme/colors.dart';
import 'package:investing101_development/shared/widgets/avatar_speech_bubble.dart';
import 'package:investing101_development/shared/widgets/progress_bar_top_nav.dart';
import 'package:investing101_development/shared/widgets/three_d_button.dart';

class OnboardingAnimationScreen extends StatelessWidget {
  const OnboardingAnimationScreen({
    super.key,
    required this.progress,
    required this.bubbleText,
    required this.centerContent,
    required this.primaryButtonLabel,
    required this.onPrimaryTap,
    this.secondaryButtonLabel,
    this.onSecondaryTap,
  });

  final double progress;
  final String bubbleText;
  final Widget centerContent;
  final String primaryButtonLabel;
  final VoidCallback onPrimaryTap;
  final String? secondaryButtonLabel;
  final VoidCallback? onSecondaryTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ProgressBarTopNav(progress: progress),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
                child: Column(
                  children: [
                    AvatarSpeechBubble(text: bubbleText),
                    const SizedBox(height: 32),
                    Expanded(child: Center(child: centerContent)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ThreeDButton(
                label: primaryButtonLabel,
                backgroundColor: AppColors.primary,
                shadowColor: AppColors.shadowOnPrimary,
                textColor: Colors.white,
                onTap: onPrimaryTap,
              ),
              if (secondaryButtonLabel != null)
                TextButton(
                  onPressed: onSecondaryTap,
                  child: Text(
                    secondaryButtonLabel!,
                    style: const TextStyle(
                      fontFamily: 'TmoneyRoundWind',
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                      height: 18 / 13,
                      letterSpacing: -0.26,
                      color: Color(0xFF637782),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
