import 'package:get/get.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/features/onboarding/presentation/splash_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/start_screen.dart';
import 'package:investing101_development/features/onboarding/presentation/welcome_screen.dart';

final appPages = [
  GetPage(name: Routes.splash, page: () => const SplashScreen()),
  GetPage(name: Routes.start, page: () => const StartScreen()),
  GetPage(name: Routes.welcome, page: () => const WelcomeScreen()),
];
