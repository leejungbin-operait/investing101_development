import 'package:get/get.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/features/onboarding/presentation/permission_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/pre_quiz_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/splash_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/start_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/survey_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/welcome_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/widget_installation_screen.dart';

final appPages = [
  GetPage(name: Routes.splash, page: () => const SplashScreen()),
  GetPage(name: Routes.start, page: () => const StartScreen()),
  GetPage(name: Routes.welcome, page: () => const WelcomeScreen()),
  GetPage(name: Routes.preQuiz, page: () => const PreQuizScreen()),
  GetPage(name: Routes.survey, page: () => const SurveyScreen()),
  GetPage(name: Routes.permission, page: () => const PermissionScreen()),
  GetPage(
    name: Routes.widgetInstallation,
    page: () => const WidgetInstallationScreen(),
  ),
];
