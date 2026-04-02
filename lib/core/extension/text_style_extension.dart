import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TextSize { sm, lg, xl, xxl, xxxl, xxxxl }

enum AppFontWeight { light, regular, medium, bold, extraBold }

extension TextSizeExtension on TextSize {
  double get size {
    switch (this) {
      case TextSize.sm:
        return 12.0;
      case TextSize.lg:
        return 14.0;
      case TextSize.xl:
        return 16.0;
      case TextSize.xxl:
        return 20.0;
      case TextSize.xxxl:
        return 24.0;
      case TextSize.xxxxl:
        return 32.0;
    }
  }

  TextStyle getStyle({
    Color? color,
    AppFontWeight weight = AppFontWeight.regular,
    double? letterSpacing,
    String? fontFamily,
    TextDecoration? textDecoration,
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: weight.appFontWeight,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily ?? GoogleFonts.inter().fontFamily,
      decoration: textDecoration,
    );
  }
}

extension TextFontWeightExtension on AppFontWeight {
  FontWeight get appFontWeight {
    switch (this) {
      case AppFontWeight.light:
        return FontWeight.w300;
      case AppFontWeight.regular:
        return FontWeight.w400;
      case AppFontWeight.medium:
        return FontWeight.w500;
      case AppFontWeight.bold:
        return FontWeight.w700;
      case AppFontWeight.extraBold:
        return FontWeight.w900;
    }
  }
}
