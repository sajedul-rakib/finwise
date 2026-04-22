import 'package:flutter/material.dart';

/// FinWise Spacing Tokens — 4pt base grid
abstract class FinWiseSpacing {
  static const double px0 = 0.0;
  static const double px1 = 4.0;
  static const double px2 = 8.0;
  static const double px3 = 12.0;
  static const double px4 = 16.0;
  static const double px5 = 20.0;
  static const double px6 = 24.0;
  static const double px7 = 28.0;
  static const double px8 = 32.0;
  static const double px10 = 40.0;
  static const double px12 = 48.0;
  static const double px14 = 56.0;
  static const double px16 = 64.0;
  static const double px20 = 80.0;

  static const double touchTarget = 44.0; // min a11y tap target

  static const EdgeInsets screenPadding = EdgeInsets.symmetric(horizontal: px6);
  static const EdgeInsets cardPadding = EdgeInsets.all(px4);
  static const EdgeInsets cardPaddingLg = EdgeInsets.all(px5);
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: px4,
    vertical: px3,
  );
}

///icon size
abstract class FinWiseIconSize {
  // Semantic aliases
  static const double iconSm = 16.0;
  static const double iconMd = 20.0;
  static const double iconLg = 24.0;
  static const double iconXl = 32.0;
}

/// FinWise Border Radius Tokens
abstract class FinWiseRadius {
  static const double none = 0.0;
  static const double sm = 6.0;
  static const double md = 10.0;
  static const double lg = 14.0;
  static const double xl = 18.0;
  static const double xxl = 24.0;
  static const double buttonBorderRadius = 30.0;
  static const double pill = 100.0;
  static const double full = 999.0;

  static const BorderRadius smRadius = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdRadius = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgRadius = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xlRadius = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius xxlRadius = BorderRadius.all(Radius.circular(xxl));
  static const BorderRadius pillRadius = BorderRadius.all(
    Radius.circular(pill),
  );

  // Card specific
  static const BorderRadius cardRadius = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius bottomSheetRadius = BorderRadius.only(
    topLeft: Radius.circular(xxl),
    topRight: Radius.circular(xxl),
  );

  static const BorderRadius buttonRadius = BorderRadius.all(
    Radius.circular(buttonBorderRadius),
  );
}

/// FinWise Shadow Tokens
abstract class FinWiseShadows {
  static const List<BoxShadow> none = [];

  static const List<BoxShadow> sm = [
    BoxShadow(color: Color(0x0A6C63FF), blurRadius: 4, offset: Offset(0, 2)),
  ];

  static const List<BoxShadow> md = [
    BoxShadow(color: Color(0x146C63FF), blurRadius: 12, offset: Offset(0, 4)),
  ];

  static const List<BoxShadow> lg = [
    BoxShadow(color: Color(0x1E6C63FF), blurRadius: 24, offset: Offset(0, 8)),
  ];

  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x126C63FF),
      blurRadius: 20,
      offset: Offset(0, 6),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> cardDark = [
    BoxShadow(
      color: Color(0x40000000),
      blurRadius: 20,
      offset: Offset(0, 6),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> button = [
    BoxShadow(color: Color(0x336C63FF), blurRadius: 16, offset: Offset(0, 6)),
  ];
}

/// FinWise Animation Tokens
abstract class FinWiseDurations {
  static const Duration instant = Duration(milliseconds: 50);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 400);
  static const Duration xSlow = Duration(milliseconds: 600);

  static const Curve easeIn = Curves.easeIn;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve spring = Curves.elasticOut;
  static const Curve decelerate = Curves.decelerate;
}
