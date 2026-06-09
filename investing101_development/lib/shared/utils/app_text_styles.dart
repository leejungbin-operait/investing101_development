import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  // Headlines
  static const TextStyle header1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.25,
  );

  static const TextStyle header2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.3,
  );

  // Body
  static const TextStyle bodySmall = TextStyle(fontSize: 14, height: 1.4);

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  // Labels / Buttons
  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );
}
