import 'package:go_router/go_router.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/features/onboarding/presentation/goal_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/permission_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/pre_quiz_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/splash_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/start_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/survey_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/welcome_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/widget_installation_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/widget_ios_screen.dart';

final appRouter = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.start,
      builder: (context, state) => const StartScreen(),
    ),
    GoRoute(
      path: Routes.welcome,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: Routes.preQuiz,
      builder: (context, state) => const PreQuizScreen(),
    ),
    GoRoute(
      path: Routes.survey,
      builder: (context, state) => const SurveyScreen(),
    ),
    GoRoute(
      path: Routes.permission,
      builder: (context, state) => const PermissionScreen(),
    ),
    GoRoute(
      path: Routes.widgetInstallation,
      builder: (context, state) => const WidgetInstallationScreen(),
    ),
    GoRoute(
      path: Routes.widgetIos,
      builder: (context, state) => const WidgetIosScreen(),
    ),
    GoRoute(
      path: Routes.goal,
      builder: (context, state) => const GoalScreen(),
    ),
  ],
);
