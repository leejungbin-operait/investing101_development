import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investing101_development/core/theme/colors.dart';
import 'package:investing101_development/shared/widgets/avatar_speech_bubble.dart';
import 'package:investing101_development/shared/widgets/progress_bar_top_nav.dart';
import 'package:investing101_development/shared/widgets/three_d_button.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  static const _features = [
    (
      icon: 'assets/images/icon_bar_chart.svg',
      title: '차트 보는 눈이 생겨요',
      subtitle: '뭘 사야 할지, 스스로 판단할 수 있게 돼요',
    ),
    (
      icon: 'assets/images/icon_eyes.svg',
      title: '왜 잃었는지 보여요',
      subtitle: '감이 아닌 근거로 손절 타이밍, 진입 기준이 달라져요',
    ),
    (
      icon: 'assets/images/icon_glowing_star.svg',
      title: '억지로 안 해도 이어져요',
      subtitle: '매일 5분, 퀘스트와 리그로 어느새 루틴이 돼 있어요',
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
                    AvatarSpeechBubble(
                      text: '3개월 내에 다음 목표를 달성할 수 있어요!',
                      avatar: Image.asset(
                        'assets/images/quiz_avatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 32),
                    for (final feature in _features)
                      _FeatureRow(
                        icon: feature.icon,
                        title: feature.title,
                        subtitle: feature.subtitle,
                      ),
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
            label: '시작해볼게요',
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

class _FeatureRow extends StatelessWidget {
  const _FeatureRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final String icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: SvgPicture.asset(icon, fit: BoxFit.contain),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'TmoneyRoundWind',
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    height: 22 / 15,
                    letterSpacing: -0.45,
                    color: Color(0xFF161F22),
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'TmoneyRoundWind',
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                    height: 18 / 12,
                    letterSpacing: -0.24,
                    color: Color(0xFF637782),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
