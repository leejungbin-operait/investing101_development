import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/shared/widgets/onboarding_animation_screen.dart';

class WidgetInstallationScreen extends StatelessWidget {
  const WidgetInstallationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingAnimationScreen(
      progress: 0.825,
      bubbleText: '홈 화면에서 인베스팅101\n학습 기록을 확인할 수 있어요!',
      centerContent: Image.asset(
        'assets/images/widget_install_phone.png',
        width: 335,
        height: 446,
        fit: BoxFit.contain,
      ),
      primaryButtonLabel: '위젯 추가하기',
      onPrimaryTap: () {
        context.push(Routes.widgetIos);
      },
      secondaryButtonLabel: '나중에',
      onSecondaryTap: () {},
    );
  }
}
