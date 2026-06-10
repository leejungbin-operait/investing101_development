import 'package:flutter/material.dart';

/// Centralized app color definitions.

/// Rules:
/// - Do NOT use Colors.* directly in UI
///   ex) Colors.blue, Color(0xFFE74C3C)
/// - Always use AppColors
///   ex) AppColors.primary
/// - Keep semantic naming (primary, error, etc.)

abstract final class AppColors {
  AppColors._(); // private constructor

  // ==============================
  // 🎯 Brand Colors
  // ==============================
  static const Color primary = Color(0xFF6D60F7);
  static const Color secondary = Color(0xFF50E3C2);

  // ==============================
  // 🧱 Backgrounds
  // ==============================
  static const Color background = Color(0xFFF8F9FB);
  static const Color surface = Color(0xFFFFFFFF);

  // ==============================
  // 🧱 Shadows
  // ==============================
  static const Color shadowOnPrimary = Color(0xFF4A40E9);
  static const Color shadowOnSurface = Color(0xFFD4DBDE);

  // ==============================
  // 📝 Text Colors
  // ==============================
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B6B6B);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ==============================
  // ⚠️ Status Colors
  // ==============================
  static const Color success = Color(0xFF2ECC71);
  static const Color warning = Color(0xFFF5A623);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF3498DB);

  // ==============================
  // 🔲 Borders & Dividers
  // ==============================
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);

  // ==============================
  // 🎛 Disabled / States
  // ==============================
  static const Color disabled = Color(0xFFCCCCCC);
  static const Color overlay = Color(0x66000000); // 40% black

  // ==============================
  // 🌙 Dark Mode (optional)
  // ==============================
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);
}
