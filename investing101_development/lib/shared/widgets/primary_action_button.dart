import 'package:flutter/material.dart';
import 'package:investing101_development/core/theme/colors.dart';
import 'package:investing101_development/shared/widgets/three_d_button.dart';

/// A full-width primary action button. Renders as a flat disabled
/// container when [enabled] is false, or a [ThreeDButton] when true.
class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    super.key,
    required this.label,
    required this.enabled,
    required this.onTap,
  });

  final String label;
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
        child: Text(
          label,
          style: const TextStyle(
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
      label: label,
      backgroundColor: AppColors.primary,
      shadowColor: AppColors.shadowOnPrimary,
      textColor: Colors.white,
      onTap: onTap,
    );
  }
}
