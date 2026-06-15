import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investing101_development/core/routes/app_routes.dart';
import 'package:investing101_development/core/theme/colors.dart';
import 'package:investing101_development/shared/widgets/primary_action_button.dart';
import 'package:investing101_development/shared/widgets/progress_bar_top_nav.dart';
import 'package:investing101_development/shared/widgets/terms_agreement_text.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final _controller = TextEditingController();

  bool _isValid = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    setState(() {
      _isValid = value.trim().isNotEmpty;
    });
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
                    _EmailField(controller: _controller, onChanged: _onChanged),
                    const SizedBox(height: 24),
                    PrimaryActionButton(
                      label: '계속하기',
                      enabled: _isValid,
                      onTap: () {
                        context.push(Routes.password);
                      },
                    ),
                    const SizedBox(height: 24),
                    Center(child: const TermsAgreementText()),
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
      '이메일 주소를 입력하세요',
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
  const _EmailField({required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  static const _borderColor = Color(0xFFD4DBDE);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(
        fontFamily: 'TmoneyRoundWind',
        fontWeight: FontWeight.w800,
        fontSize: 15,
        height: 22 / 15,
        letterSpacing: -0.45,
        color: Color(0xFF161F22),
      ),
      decoration: InputDecoration(
        hintText: '이메일',
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
          borderSide: const BorderSide(color: _borderColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: _borderColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}
