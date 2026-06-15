import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investing101_development/core/theme/colors.dart';
import 'package:investing101_development/shared/widgets/progress_bar_top_nav.dart';
import 'package:investing101_development/shared/widgets/three_d_button.dart';

class NicknameScreen extends StatefulWidget {
  const NicknameScreen({super.key});

  @override
  State<NicknameScreen> createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> {
  final _controller = TextEditingController();

  static final _validCharacters = RegExp(r'^[a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ]*$');

  bool _hasInvalidCharacters = false;
  bool _isValid = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {
      _hasInvalidCharacters = !_validCharacters.hasMatch(value);
      _isValid = value.trim().isNotEmpty && !_hasInvalidCharacters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const ProgressBarTopNav(progress: 0.05),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _Heading(),
                    const SizedBox(height: 24),
                    _NicknameField(
                      controller: _controller,
                      hasError: _hasInvalidCharacters,
                      onChanged: _onChanged,
                    ),
                    const SizedBox(height: 24),
                    _NextButton(enabled: _isValid, onTap: () {}),
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

class _Heading extends StatelessWidget {
  const _Heading();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '어떻게 불러드리면 될까요?',
          style: TextStyle(
            fontFamily: 'TmoneyRoundWind',
            fontWeight: FontWeight.w800,
            fontSize: 17,
            height: 24 / 17,
            letterSpacing: -0.51,
            color: Color(0xFF161F22),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          '닉네임은 언제든 변경할 수 있어요',
          style: TextStyle(
            fontFamily: 'TmoneyRoundWind',
            fontWeight: FontWeight.w800,
            fontSize: 13,
            height: 18 / 13,
            letterSpacing: -0.26,
            color: Color(0xFF637782),
          ),
        ),
      ],
    );
  }
}

class _NicknameField extends StatelessWidget {
  const _NicknameField({
    required this.controller,
    required this.hasError,
    required this.onChanged,
  });

  final TextEditingController controller;
  final bool hasError;
  final ValueChanged<String> onChanged;

  static const _defaultBorderColor = Color(0xFFD4DBDE);
  static const _errorColor = Color(0xFFE42939);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          maxLength: 50,
          onChanged: onChanged,
          style: const TextStyle(
            fontFamily: 'TmoneyRoundWind',
            fontWeight: FontWeight.w800,
            fontSize: 15,
            height: 22 / 15,
            letterSpacing: -0.45,
            color: Color(0xFF161F22),
          ),
          decoration: InputDecoration(
            counterText: '',
            hintText: '닉네임',
            hintStyle: const TextStyle(
              fontFamily: 'TmoneyRoundWind',
              fontWeight: FontWeight.w800,
              fontSize: 15,
              height: 22 / 15,
              letterSpacing: -0.45,
              color: Color(0xFF9AABB2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: _defaultBorderColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: _defaultBorderColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: hasError ? _errorColor : AppColors.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: _errorColor, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: _errorColor, width: 2),
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/icon_error.svg',
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 4),
                const Expanded(
                  child: Text(
                    '사용할 수 없는 문자가 포함되어 있어요',
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWind',
                      fontWeight: FontWeight.w800,
                      fontSize: 11,
                      height: 14 / 11,
                      letterSpacing: -0.22,
                      color: _errorColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({required this.enabled, required this.onTap});

  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return Container(
        width: double.infinity,
        height: 48,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFD4DBDE),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          '다음',
          style: TextStyle(
            fontFamily: 'TmoneyRoundWind',
            fontWeight: FontWeight.w800,
            fontSize: 15,
            height: 22 / 15,
            letterSpacing: -0.45,
            color: Color(0xFFB7C3C8),
          ),
        ),
      );
    }

    return ThreeDButton(
      label: '다음',
      backgroundColor: AppColors.primary,
      shadowColor: AppColors.shadowOnPrimary,
      textColor: Colors.white,
      onTap: onTap,
    );
  }
}
