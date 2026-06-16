import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investing101_development/core/theme/colors.dart';

/// Shared password [TextField] with a visibility toggle and an
/// optional error helper row shown below it.
class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hasError,
    required this.errorMessage,
    required this.onChanged,
    required this.onToggleObscureText,
  });

  final TextEditingController controller;
  final bool obscureText;
  final bool hasError;
  final String errorMessage;
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
                Expanded(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(
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
