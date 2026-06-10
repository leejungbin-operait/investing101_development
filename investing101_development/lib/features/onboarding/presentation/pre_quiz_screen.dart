import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/shared/widgets/onboarding_message_screen.dart';

class PreQuizScreen extends StatelessWidget {
  const PreQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingMessageScreen(
      bubbleText: '첫 레슨 시작하기 전에\n간단한 질문 5개만 여쭤볼게요!',
      characterAsset: 'assets/images/welcome_character.png',
      buttonText: '계속하기',
      onButtonTap: () {
        Get.toNamed(Routes.preQuiz);
      },
    );
  }
}
