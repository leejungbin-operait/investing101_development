import 'package:flutter/material.dart';
import 'package:investing101_development/core/theme/colors.dart';
import 'package:investing101_development/shared/widgets/avatar_speech_bubble.dart';
import 'package:investing101_development/shared/widgets/progress_bar_top_nav.dart';
import 'package:investing101_development/shared/widgets/three_d_button.dart';

/// Shared layout for onboarding survey screens: a top progress bar with
/// back navigation, an avatar with a speech-bubble question, a fixed
/// set of difficulty-style answer options, and a primary "다음" button.
class OnboardingSurveyScreen extends StatelessWidget {
  const OnboardingSurveyScreen({
    super.key,
    required this.questionText,
    required this.progress,
    required this.onNext,
  });

  /// The question shown inside the speech bubble.
  final String questionText;

  /// Progress bar fill, from 0.0 to 1.0.
  final double progress;

  final VoidCallback onNext;

  static const _options = [
    (text: '주식이 뭔지 전혀 몰라요', level: 0, selected: true),
    (text: '들어봤는데 사본 적은 없어요', level: 1, selected: false),
    (text: '한두 번 사봤는데 잘 모르고 샀어요', level: 2, selected: false),
    (text: '기본은 알고 꾸준히 하고 있어요', level: 3, selected: false),
    (text: '재무제표, 차트 분석까지 해요', level: 4, selected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ProgressBarTopNav(progress: progress),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
                child: Column(
                  children: [
                    AvatarSpeechBubble(text: questionText),
                    const SizedBox(height: 32),
                    for (var i = 0; i < _options.length; i++) ...[
                      if (i > 0) const SizedBox(height: 8),
                      _OptionButton(
                        text: _options[i].text,
                        difficultyLevel: _options[i].level,
                        selected: _options[i].selected,
                      ),
                    ],
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
          child: ThreeDButton(
            label: '다음',
            backgroundColor: AppColors.primary,
            shadowColor: AppColors.shadowOnPrimary,
            textColor: Colors.white,
            onTap: onNext,
          ),
        ),
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  const _OptionButton({
    required this.text,
    required this.difficultyLevel,
    required this.selected,
  });

  final String text;
  final int difficultyLevel;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final accentColor = selected
        ? AppColors.primary
        : const Color(0xFFD4DBDE);

    return SizedBox(
      height: 45,
      child: Stack(
        children: [
          Positioned(
            top: 3,
            left: 0,
            right: 0,
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 42,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: accentColor, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'TmoneyRoundWind',
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                      height: 18 / 13,
                      letterSpacing: -0.26,
                      color: Color(0xFF161F22),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: _DifficultyBars(level: difficultyLevel),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DifficultyBars extends StatelessWidget {
  const _DifficultyBars({required this.level});

  /// Number of bars (0-4) shown at full opacity.
  final int level;

  static const _heights = [7.0, 10.0, 14.0, 18.0];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        for (var i = 0; i < _heights.length; i++) ...[
          if (i > 0) const SizedBox(width: 1),
          Container(
            width: 5,
            height: _heights[i],
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: i < level ? 1.0 : 0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ],
    );
  }
}
