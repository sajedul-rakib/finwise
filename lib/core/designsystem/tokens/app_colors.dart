// ─────────────────────────────────────────────────────────────
// app_colors.dart
//
// SEMANTIC tokens via ThemeExtension.
// Widgets call: context.appColors.surfacePrimary
// Never reference AppPalette directly in UI code.
// ─────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';

import '../design_system.dart';

// ── Extension accessor ────────────────────────────────────────
extension AppColorsContext on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}

// ── Token definition ──────────────────────────────────────────
@immutable
final class AppColors extends ThemeExtension<AppColors> {
  // ── Surface ───────────────────────────────────────────────
  final Color surfacePrimary;
  final Color surfaceSecondary;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textOnPrimary;
  final Color textOnSecondary;
  final Color textOnTertiary;
  final Color accentPrimary;
  final Color accentSecondary;
  final Color accentTertiary;

  const AppColors({
    required this.surfacePrimary,
    required this.surfaceSecondary,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textOnPrimary,
    required this.textOnSecondary,
    required this.textOnTertiary,
    required this.accentPrimary,
    required this.accentSecondary,
    required this.accentTertiary,
  });

  // ── Light theme ─────────────────────────────────────────────
  static const light = AppColors(
    surfacePrimary: AppPalette.neutral0,
    surfaceSecondary: AppPalette.neutral50,
    textPrimary: AppPalette.neutral900,
    textSecondary: AppPalette.neutral700,
    textTertiary: AppPalette.neutral500,
    textOnPrimary: AppPalette.neutral0,
    textOnSecondary: AppPalette.neutral900,
    textOnTertiary: AppPalette.neutral900,
    accentPrimary: AppPalette.brand500,
    accentSecondary: AppPalette.brand300,
    accentTertiary: AppPalette.brand100,
  );

  // ── Dark theme ──────────────────────────────────────────────
  static const dark = AppColors(
    surfacePrimary: AppPalette.neutral900,
    surfaceSecondary: AppPalette.neutral800,
    textPrimary: AppPalette.neutral0,
    textSecondary: AppPalette.neutral200,
    textTertiary: AppPalette.neutral400,
    textOnPrimary: AppPalette.neutral900,
    textOnSecondary: AppPalette.neutral0,
    textOnTertiary: AppPalette.neutral0,
    accentPrimary: AppPalette.brand300,
    accentSecondary: AppPalette.brand100,
    accentTertiary: AppPalette.brand50,
  );

  @override
  ThemeExtension<AppColors> copyWith() {
    return AppColors(
      surfacePrimary: surfacePrimary,
      surfaceSecondary: surfaceSecondary,
      textPrimary: textPrimary,
      textSecondary: textSecondary,
      textTertiary: textTertiary,
      textOnPrimary: textOnPrimary,
      textOnSecondary: textOnSecondary,
      textOnTertiary: textOnTertiary,
      accentPrimary: accentPrimary,
      accentSecondary: accentSecondary,
      accentTertiary: accentTertiary,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) return this;
    return AppColors(
      surfacePrimary: Color.lerp(surfacePrimary, other.surfacePrimary, t)!,
      surfaceSecondary: Color.lerp(
        surfaceSecondary,
        other.surfaceSecondary,
        t,
      )!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t)!,
      textOnSecondary: Color.lerp(textOnSecondary, other.textOnSecondary, t)!,
      textOnTertiary: Color.lerp(textOnTertiary, other.textOnTertiary, t)!,
      accentPrimary: Color.lerp(accentPrimary, other.accentPrimary, t)!,
      accentSecondary: Color.lerp(accentSecondary, other.accentSecondary, t)!,
      accentTertiary: Color.lerp(accentTertiary, other.accentTertiary, t)!,
    );
  }
}
