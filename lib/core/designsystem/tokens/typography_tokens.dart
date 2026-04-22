import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// FinWise Typography Tokens
/// Font: DM Sans (primary), DM Mono (numbers/amounts)
abstract class FinWiseTypography {
  // ─── Font Families ─────────────────────────────────────────────────────────
  static String fontFamily = GoogleFonts.inter().fontFamily ?? 'DM Sans';
  static const String fontFamilyMono = 'DmMono';

  // ─── Font Sizes ────────────────────────────────────────────────────────────
  static const double size2xs = 10.0;
  static const double sizeXs = 12.0;
  static const double sizeSm = 14.0;
  static const double sizeMd = 16.0;
  static const double sizeLg = 18.0;
  static const double sizeXl = 20.0;
  static const double size2xl = 24.0;
  static const double size3xl = 28.0;
  static const double size4xl = 32.0;
  static const double size5xl = 40.0;

  // ─── Font Weights ──────────────────────────────────────────────────────────
  static const FontWeight weightLight = FontWeight.w300;
  static const FontWeight weightRegular = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightSemiBold = FontWeight.w600;
  static const FontWeight weightBold = FontWeight.w700;

  // ─── Line Heights ──────────────────────────────────────────────────────────
  static const double lineHeightTight = 1.2;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightRelaxed = 1.75;

  // ─── Letter Spacing ────────────────────────────────────────────────────────
  static const double trackingTight = -0.5;
  static const double trackingNormal = 0.0;
  static const double trackingWide = 0.5;
  static const double trackingWidest = 1.5;

  // ─── Text Styles ───────────────────────────────────────────────────────────

  /// Large balance / hero amount display
  static const TextStyle amountDisplay = TextStyle(
    fontFamily: fontFamilyMono,
    fontSize: size5xl,
    fontWeight: weightBold,
    letterSpacing: trackingTight,
    height: lineHeightTight,
  );

  /// Medium amount (card, transaction)
  static const TextStyle amountLarge = TextStyle(
    fontFamily: fontFamilyMono,
    fontSize: size2xl,
    fontWeight: weightBold,
    letterSpacing: trackingTight,
  );

  static const TextStyle amountMedium = TextStyle(
    fontFamily: fontFamilyMono,
    fontSize: sizeLg,
    fontWeight: weightSemiBold,
  );

  static const TextStyle amountSmall = TextStyle(
    fontFamily: fontFamilyMono,
    fontSize: sizeSm,
    fontWeight: weightMedium,
  );

  // Headings
  static TextStyle heading1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: size3xl,
    fontWeight: weightBold,
    letterSpacing: trackingTight,
    height: lineHeightTight,
  );

  static TextStyle heading2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: size2xl,
    fontWeight: weightBold,
    letterSpacing: trackingTight,
  );

  static TextStyle heading3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: sizeXl,
    fontWeight: weightSemiBold,
  );

  static TextStyle heading4 = TextStyle(
    fontFamily: fontFamily,
    fontSize: sizeLg,
    fontWeight: weightSemiBold,
  );

  // Body
  static TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: sizeMd,
    fontWeight: weightRegular,
    height: lineHeightNormal,
  );

  static TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: sizeSm,
    fontWeight: weightRegular,
    height: lineHeightNormal,
  );

  static TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: sizeXs,
    fontWeight: weightRegular,
    height: lineHeightNormal,
  );

  // Labels
  static TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: sizeSm,
    fontWeight: weightSemiBold,
    letterSpacing: trackingWide,
  );

  static TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: sizeXs,
    fontWeight: weightMedium,
    letterSpacing: trackingWide,
  );

  static TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: size2xs,
    fontWeight: weightMedium,
    letterSpacing: trackingWidest,
  );

  // Caption
  static TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: sizeXs,
    fontWeight: weightRegular,
    letterSpacing: trackingNormal,
  );

  // Button
  static TextStyle button = TextStyle(
    fontFamily: fontFamily,
    fontSize: sizeMd,
    fontWeight: weightSemiBold,
    letterSpacing: trackingWide,
  );

  static TextStyle buttonSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: sizeSm,
    fontWeight: weightSemiBold,
    letterSpacing: trackingWide,
  );
}
