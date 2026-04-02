import 'package:flutter/material.dart';

import '../extension/text_style_extension.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextSize size;
  final AppFontWeight weight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final String? fontFamily;
  final TextDecoration? textDecoration;

  const AppText(
    this.text, {
    super.key,
    this.size = TextSize.lg,
    this.weight = AppFontWeight.regular,
    this.color,
    this.textAlign,
    this.overflow,
    this.fontFamily,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      style: size.getStyle(
        color: color,
        textDecoration: textDecoration,
        weight: weight,
        fontFamily: fontFamily,
      ),
    );
  }
}
