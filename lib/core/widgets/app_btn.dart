import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.bgColor,
    this.textStyle,
  });

  final String title;
  final Function() onPressed;
  final Color? bgColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? AppColors.caribbeanGreen,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style:
            textStyle ??
            TextStyle(
              color: bgColor == null
                  ? AppColors.textGreenColor
                  : AppColors.textGreenColor,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
      ),
    );
  }
}
