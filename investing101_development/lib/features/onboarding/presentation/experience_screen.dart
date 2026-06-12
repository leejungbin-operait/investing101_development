import 'package:flutter/material.dart';
import 'package:investing101_development/core/theme/colors.dart';
import 'package:investing101_development/shared/widgets/avatar_speech_bubble.dart';
import 'package:investing101_development/shared/widgets/progress_bar_top_nav.dart';
import 'package:investing101_development/shared/widgets/three_d_button.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  static const _options = [
    (
      title: '투자가 처음이신가요?',
      subtitle: '기초 감각부터 천천히 쌓아봐요!',
      selected: true,
      recommended: false,
    ),
    (
      title: '어느 정도 경험이 있으신가요?',
      subtitle: '지금 실력으로 시작 지점을 찾아봐요!',
      selected: false,
      recommended: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const ProgressBarTopNav(progress: 0.825),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
                child: Column(
                  children: [
                    const AvatarSpeechBubble(text: '이제 가장 알맞은 시작점을 찾아봐요!'),
                    const SizedBox(height: 32),
                    for (var i = 0; i < _options.length; i++) ...[
                      if (i > 0) const SizedBox(height: 8),
                      _ExperienceOptionCard(
                        title: _options[i].title,
                        subtitle: _options[i].subtitle,
                        selected: _options[i].selected,
                        recommended: _options[i].recommended,
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
            label: '계속하기',
            backgroundColor: AppColors.primary,
            shadowColor: AppColors.shadowOnPrimary,
            textColor: Colors.white,
            onTap: () {},
          ),
        ),
      ),
    );
  }
}

class _ExperienceOptionCard extends StatelessWidget {
  const _ExperienceOptionCard({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.recommended,
  });

  final String title;
  final String subtitle;
  final bool selected;
  final bool recommended;

  static const _unselectedColor = Color(0xFFD4DBDE);

  @override
  Widget build(BuildContext context) {
    final accentColor = selected ? AppColors.primary : _unselectedColor;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 3,
          bottom: -3,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: accentColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
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
              const SizedBox(height: 4),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'TmoneyRoundWind',
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                  height: 14 / 11,
                  letterSpacing: -0.22,
                  color: Color(0xFF637782),
                ),
              ),
            ],
          ),
        ),
        if (recommended)
          Positioned(
            top: -5,
            right: -5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFA7A0FA),
                border: Border.all(color: AppColors.primary, width: 2),
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Text(
                '권장',
                style: TextStyle(
                  fontFamily: 'TmoneyRoundWind',
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                  height: 18 / 12,
                  letterSpacing: -0.24,
                  color: Color(0xFF1B096C),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
