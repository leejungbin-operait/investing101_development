import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/shared/widgets/progress_bar_top_nav.dart';
import 'package:investing101_development/shared/widgets/terms_agreement_text.dart';

class SocialLoginScreen extends StatelessWidget {
  const SocialLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const ProgressBarTopNav(progress: 2 / 4),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const _LogoSection(),
                    const SizedBox(height: 40),
                    _SocialButton(
                      iconAsset: 'assets/images/icon_social_email.svg',
                      label: '이메일로 계속하기',
                      onTap: () {
                        context.push(Routes.email);
                      },
                    ),
                    const SizedBox(height: 8),
                    _SocialButton(
                      iconAsset: 'assets/images/icon_social_google.svg',
                      label: 'Google로 계속하기',
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                    _SocialButton(
                      iconAsset: 'assets/images/icon_social_facebook.svg',
                      label: 'Facebook으로 계속하기',
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                    _SocialButton(
                      iconAsset: 'assets/images/icon_social_apple.svg',
                      label: 'Apple로 계속하기',
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    const TermsAgreementText(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoSection extends StatelessWidget {
  const _LogoSection();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animations/logo/logo_pressable.json',
        width: 100,
        height: 98,
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.iconAsset,
    required this.label,
    required this.onTap,
  });

  final String iconAsset;
  final String label;
  final VoidCallback onTap;

  static const _borderColor = Color(0xFFD4DBDE);
  static const _textColor = Color(0xFF4D5C65);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: _borderColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: _borderColor, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(iconAsset, width: 20, height: 20),
                    const SizedBox(width: 8),
                    Text(
                      label,
                      style: const TextStyle(
                        fontFamily: 'TmoneyRoundWind',
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                        height: 22 / 15,
                        letterSpacing: -0.45,
                        color: _textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
