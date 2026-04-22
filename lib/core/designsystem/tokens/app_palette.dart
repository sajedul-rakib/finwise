// ─────────────────────────────────────────────────────────────
// app_palette.dart
//
// PRIMITIVE tokens — raw color values only.
// These are NEVER used directly in widgets.
// Widgets always consume SEMANTIC tokens from AppColors.
// ─────────────────────────────────────────────────────────────

import 'package:flutter/painting.dart';

abstract final class AppPalette {
  AppPalette._();

  // ── Brand ramp ──────────────────────────────────────────────
  static const Color brand50 = Color(0xFFEEF2FF);
  static const Color brand100 = Color(0xFFE0E7FF);
  static const Color brand200 = Color(0xFFC7D2FE);
  static const Color brand300 = Color(0xFFA5B4FC);
  static const Color brand400 = Color(0xFF818CF8);
  static const Color brand500 = Color(0xFF6366F1); // primary
  static const Color brand600 = Color(0xFF4F46E5);
  static const Color brand700 = Color(0xFF4338CA);
  static const Color brand800 = Color(0xFF3730A3);
  static const Color brand900 = Color(0xFF312E81);

  // ── Neutral ramp ────────────────────────────────────────────
  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFF8FAFC);
  static const Color neutral100 = Color(0xFFF1F5F9);
  static const Color neutral200 = Color(0xFFE2E8F0);
  static const Color neutral300 = Color(0xFFCBD5E1);
  static const Color neutral400 = Color(0xFF94A3B8);
  static const Color neutral500 = Color(0xFF64748B);
  static const Color neutral600 = Color(0xFF475569);
  static const Color neutral700 = Color(0xFF334155);
  static const Color neutral800 = Color(0xFF1E293B);
  static const Color neutral900 = Color(0xFF0F172A);
  static const Color neutral950 = Color(0xFF020617);

  // ── Semantic ramps ──────────────────────────────────────────
  static const Color success500 = Color(0xFF22C55E);
  static const Color success600 = Color(0xFF16A34A);
  static const Color success100 = Color(0xFFDCFCE7);

  static const Color warning500 = Color(0xFFF59E0B);
  static const Color warning600 = Color(0xFFD97706);
  static const Color warning100 = Color(0xFFFEF3C7);

  static const Color error500 = Color(0xFFEF4444);
  static const Color error600 = Color(0xFFDC2626);
  static const Color error100 = Color(0xFFFEE2E2);

  static const Color info500 = Color(0xFF3B82F6);
  static const Color info600 = Color(0xFF2563EB);
  static const Color info100 = Color(0xFFDBEAFE);
}
