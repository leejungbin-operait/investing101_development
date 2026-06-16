import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:investing101_development/core/theme/colors.dart';
import 'package:investing101_development/shared/widgets/password_field.dart';
import 'package:investing101_development/shared/widgets/primary_action_button.dart';

class ExistingEmailScreen extends StatefulWidget {
  const ExistingEmailScreen({super.key});

  @override
  State<ExistingEmailScreen> createState() => _ExistingEmailScreenState();
}

class _ExistingEmailScreenState extends State<ExistingEmailScreen> {
  final _passwordController = TextEditingController();

  bool _obscureText = true;
  bool _hasError = false;
  bool _hasText = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {
      _hasText = value.isNotEmpty;
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
    setState(() {
      _hasError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const _TopNav(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _Heading(),
                    const SizedBox(height: 24),
                    const _EmailField(),
                    const SizedBox(height: 12),
                    PasswordField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      hasError: _hasError,
                      errorMessage: '잘못된 아이디 또는 비밀번호',
                      onChanged: _onChanged,
                      onToggleObscureText: _toggleObscureText,
                    ),
                    const SizedBox(height: 24),
                    PrimaryActionButton(
                      label: '로그인',
                      enabled: _hasText,
                      onTap: _onSubmit,
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          '비밀번호를 잊으셨나요?',
                          style: TextStyle(
                            fontFamily: 'TmoneyRoundWind',
                            fontWeight: FontWeight.w800,
                            fontSize: 13,
                            height: 18 / 13,
                            letterSpacing: -0.26,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
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

class _TopNav extends StatelessWidget {
  const _TopNav();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFD4DBDE), width: 2),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 28,
                height: 28,
                child: Center(
                  child: SizedBox(
                    width: 19.14,
                    height: 18.52,
                    child: _BackIcon(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackIcon extends StatelessWidget {
  const _BackIcon();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/icon_back.svg');
  }
}

class _Heading extends StatelessWidget {
  const _Heading();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '프로필이 이미 있습니다',
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

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD4DBDE), width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'example@gmail.com',
        style: TextStyle(
          fontFamily: 'TmoneyRoundWind',
          fontWeight: FontWeight.w800,
          fontSize: 15,
          height: 22 / 15,
          letterSpacing: -0.45,
          color: Color(0xFF161F22),
        ),
      ),
    );
  }
}
