import 'dart:math' as math;

import 'package:flutter/material.dart';

/// A 64x64 circular avatar paired with a left-pointing speech bubble,
/// used across onboarding screens to introduce a message from the mascot.
class AvatarSpeechBubble extends StatelessWidget {
  const AvatarSpeechBubble({
    super.key,
    required this.text,
    required this.avatar,
  });

  /// The message shown inside the speech bubble.
  final String text;

  /// The avatar image, clipped to a 64x64 circle.
  final Widget avatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: SizedBox(width: 64, height: 64, child: avatar),
        ),
        const SizedBox(width: 20),
        Expanded(child: _SpeechBubble(text: text)),
      ],
    );
  }
}

class _SpeechBubble extends StatelessWidget {
  const _SpeechBubble({required this.text});

  final String text;

  static const _borderColor = Color(0xFFD4DBDE);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: _borderColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'TmoneyRoundWind',
              fontWeight: FontWeight.w800,
              fontSize: 13,
              height: 18 / 13,
              letterSpacing: -0.26,
              color: Color(0xFF161F22),
            ),
          ),
        ),
        // Left-pointing arrow
        Positioned(
          left: -9,
          top: 0,
          bottom: 0,
          child: Center(
            child: Transform.rotate(
              angle: -45 * math.pi / 180,
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: _borderColor, width: 2),
                    left: BorderSide(color: _borderColor, width: 2),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
