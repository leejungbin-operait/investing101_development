import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/core/theme/colors.dart';
import 'package:investing101_development/shared/widgets/primary_action_button.dart';
import 'package:investing101_development/shared/widgets/progress_bar_top_nav.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _controller = TextEditingController();

  static const _minLength = 8;
  static final _hasLetter = RegExp(r'[a-zA-Z]');
  static final _hasDigit = RegExp(r'\d');

  bool _obscureText = true;
  bool _hasError = false;
  bool _meetsMinLength = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {
      _meetsMinLength = value.length >= _minLength;
      if (_hasError) {
        _hasError = false;
      }
    });
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _onSubmit() {
    final text = _controller.text;
    final isValid =
        text.length >= _minLength &&
        _hasLetter.hasMatch(text) &&
        _hasDigit.hasMatch(text);

    if (!isValid) {
      setState(() {
        _hasError = true;
      });
      return;
    }
    context.push(Routes.completeSignUp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const ProgressBarTopNav(progress: 3 / 4),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _Heading(),
                    const SizedBox(height: 24),
                    _PasswordField(
                      controller: _controller,
                      obscureText: _obscureText,
                      hasError: _hasError,
                      onChanged: _onChanged,
                      onToggleObscureText: _toggleObscureText,
                    ),
                    const SizedBox(height: 24),
                    PrimaryActionButton(
                      label: '프로필 생성하기',
                      enabled: _meetsMinLength,
                      onTap: _onSubmit,
                    ),
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
    return const Text(
      '비밀번호를 설정하세요',
      style: TextStyle(
        fontFamily: 'TmoneyRoundWind',
        fontWeight: FontWeight.w800,
        fontSize: 17,
        height: 24 / 17,
        letterSpacing: -0.51,
        color: Color(0xFF161F22),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.controller,
    required this.obscureText,
    required this.hasError,
    required this.onChanged,
    required this.onToggleObscureText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final bool hasError;
  final ValueChanged<String> onChanged;
  final VoidCallback onToggleObscureText;

  static const _defaultBorderColor = Color(0xFFD4DBDE);
  static const _errorColor = Color(0xFFE42939);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          obscureText: obscureText,
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
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: const Color(0xFF9AABB2),
                size: 24,
              ),
              onPressed: onToggleObscureText,
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
                    '더 강한 비밀번호를 사용해주세요!',
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
