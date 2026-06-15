import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/shared/widgets/onboarding_animation_screen.dart';

class WidgetIosScreen extends StatelessWidget {
  const WidgetIosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingAnimationScreen(
      progress: 0.825,
      bubbleText: '먼저, 홈 화면에서 아무 곳이나 길게 누르고...',
      centerContent: Image.asset(
        'assets/images/widget_install_ios.png',
        width: 240,
        height: 428,
        fit: BoxFit.contain,
      ),
      primaryButtonLabel: '홈스크린으로 가기',
      onPrimaryTap: () {
        // SystemNavigator.pop(); // only works on Android
        context.push(Routes.goal);
      },
    );
  }
}
