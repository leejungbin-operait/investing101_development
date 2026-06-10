import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:investing101_development/core/theme/colors.dart';
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
            _TopNav(progress: progress),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
                child: Column(
                  children: [
                    _QuestionRow(questionText: questionText),
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

class _TopNav extends StatelessWidget {
  const _TopNav({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFD4DBDE), width: 2),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: Get.back,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 28,
                height: 28,
                child: Center(
                  child: SizedBox(
                    width: 19.14,
                    height: 18.52,
                    child: _BackIcon(),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: _ProgressBar(progress: progress)),
        ],
      ),
    );
  }
}

class _BackIcon extends StatelessWidget {
  const _BackIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/icon_back.svg');
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      decoration: BoxDecoration(
        color: const Color(0xFFD4DBDE),
        borderRadius: BorderRadius.circular(4),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress.clamp(0.0, 1.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.shadowOnPrimary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Container(
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(1000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _QuestionRow extends StatelessWidget {
  const _QuestionRow({required this.questionText});

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Image.asset(
            'assets/images/quiz_avatar.png',
            width: 64,
            height: 64,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(child: _QuestionBubble(text: questionText)),
      ],
    );
  }
}

class _QuestionBubble extends StatelessWidget {
  const _QuestionBubble({required this.text});

  final String text;

  static const _borderColor = Color(0xFFD4DBDE);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: _borderColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'TmoneyRoundWind',
              fontWeight: FontWeight.w800,
              fontSize: 13,
              height: 18 / 13,
              letterSpacing: -0.26,
              color: Color(0xFF161F22),
            ),
          ),
        ),
        // Left-pointing arrow
        Positioned(
          left: -9,
          top: 0,
          bottom: 0,
          child: Center(
            child: Transform.rotate(
              angle: -45 * math.pi / 180,
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: _borderColor, width: 2),
                    left: BorderSide(color: _borderColor, width: 2),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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
