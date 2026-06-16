import 'package:flutter/material.dart';

/// Shared "by signing up you agree to..." text shown on authentication
/// screens, with underlined Terms of Service / Privacy Policy mentions.
class TermsAgreementText extends StatelessWidget {
  const TermsAgreementText({super.key});

  static const _style = TextStyle(
    fontFamily: 'TmoneyRoundWind',
    fontWeight: FontWeight.w800,
    fontSize: 11,
    height: 14 / 11,
    letterSpacing: -0.22,
    color: Color(0xFF637782),
  );

  static const _underlineStyle = TextStyle(
    fontFamily: 'TmoneyRoundWind',
    fontWeight: FontWeight.w800,
    fontSize: 11,
    height: 14 / 11,
    letterSpacing: -0.22,
    color: Color(0xFF637782),
    decoration: TextDecoration.underline,
  );

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        style: _style,
        children: [
          TextSpan(text: '인베스팅101에 가입함으로써\n인베스팅101의 '),
          TextSpan(text: '이용 약관', style: _underlineStyle),
          TextSpan(text: ' 및 '),
          TextSpan(text: '개인정보처리방침', style: _underlineStyle),
          TextSpan(text: '에 동의하게 됩니다'),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
