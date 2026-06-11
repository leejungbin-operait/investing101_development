import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/shared/widgets/onboarding_survey_screen.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingSurveyScreen(
      questionText: '주식에 대해서\n얼마나 알고 계시나요?',
      progress: 0.1,
      onNext: () {
        context.push(Routes.permission);
      },
    );
  }
}
