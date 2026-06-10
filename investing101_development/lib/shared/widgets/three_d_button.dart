import 'package:flutter/material.dart';

/// A button with a flat 3D "pressed" effect: a colored shadow layer
/// offset below a foreground surface containing the label.
class ThreeDButton extends StatelessWidget {
  const ThreeDButton({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.shadowColor,
    required this.textColor,
    required this.onTap,
    this.shadowOffset = 4,
    this.borderColor,
  });

  final String label;
  final Color backgroundColor;
  final Color shadowColor;
  final Color textColor;
  final VoidCallback onTap;
  final double shadowOffset;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48 + shadowOffset,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: shadowColor,
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
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: borderColor != null
                      ? Border.all(color: borderColor!, width: 2)
                      : null,
                ),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'TmoneyRoundWind',
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      height: 22 / 15,
                      letterSpacing: -0.45,
                      color: textColor,
                    ),
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
