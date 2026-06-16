import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/shared/widgets/onboarding_message_screen.dart';

class CompleteSignUpScreen extends StatelessWidget {
  const CompleteSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingMessageScreen(
      bubbleText: '환영합니다!.\n프로필이 생성되었습니다',
      characterAsset: 'assets/animations/vesti/vesti_onboarding.json',
      buttonText: '계속하기',
      onButtonTap: () {
        // context.push(Routes.preQuiz);
      },
    );
  }
}
