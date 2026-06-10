import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/shared/widgets/onboarding_message_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingMessageScreen(
      bubbleText: '베스티에요.\n반가워요!',
      characterAsset: 'assets/images/welcome_character.png',
      buttonText: '반가워 베스티!',
      onButtonTap: () {
        Get.toNamed(Routes.preQuiz);
      },
    );
  }
}
