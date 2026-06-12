import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/core/theme/colors.dart';
import 'package:investing101_development/shared/widgets/onboarding_animation_screen.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingAnimationScreen(
      progress: 0.45,
      bubbleText: '습관이 될 수 있도록\n알림을 보내드릴게요!',
      avatar: Image.asset('assets/images/quiz_avatar.png', fit: BoxFit.cover),
      centerContent: const _NotificationPermissionCard(),
      primaryButtonLabel: '감각 알림 받기',
      onPrimaryTap: () {
        context.push(Routes.widgetInstallation);
      },
      secondaryButtonLabel: '나중에',
      onSecondaryTap: () {},
    );
  }
}

class _NotificationPermissionCard extends StatelessWidget {
  const _NotificationPermissionCard();

  static const _borderColor = Color(0xFFD4DBDE);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: _borderColor, width: 2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/images/icon_bell.svg',
                width: 19.79,
                height: 24.64,
              ),
              const SizedBox(height: 8),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'TmoneyRoundWind',
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    height: 20 / 14,
                    letterSpacing: -0.42,
                    color: Color(0xFF161F22),
                  ),
                  children: [
                    TextSpan(
                      text: '인베스팅101',
                      style: TextStyle(color: AppColors.primary),
                    ),
                    TextSpan(text: '에서 전송하는 알림을\n허용하시겠습니까?'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Column(
                children: [
                  _PermissionOptionButton(
                    label: '허용하기',
                    textColor: AppColors.primary,
                  ),
                  SizedBox(height: 4),
                  _PermissionOptionButton(
                    label: '허용 안 함',
                    textColor: Color(0xFF9AABB2),
                  ),
                ],
              ),
              Positioned(
                left: 244,
                top: 20,
                child: SvgPicture.asset(
                  'assets/images/icon_hand_point.svg',
                  width: 31.67,
                  height: 33.33,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PermissionOptionButton extends StatelessWidget {
  const _PermissionOptionButton({required this.label, required this.textColor});

  final String label;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'TmoneyRoundWind',
          fontWeight: FontWeight.w800,
          fontSize: 13,
          height: 18 / 13,
          letterSpacing: -0.26,
          color: textColor,
        ),
      ),
    );
  }
}
