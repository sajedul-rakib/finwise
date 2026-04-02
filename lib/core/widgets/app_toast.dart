import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constant/app_colors.dart';
import '../extension/text_style_extension.dart';
import 'app_text_widget.dart';

class AppToast {
  static void success(BuildContext context, String message) {
    _show(
      context,
      message,
      bgColor: AppColors.caribbeanGreen,
      textColor: AppColors.textGreenColor,
      icon: Icons.check_circle_outline,
    );
  }

  static void error(BuildContext context, String message) {
    _show(
      context,
      message,
      bgColor: AppColors.errorColor,
      textColor: Colors.white,
      icon: Icons.error_outline,
    );
  }

  static void _show(
    BuildContext context,
    String message, {
    required Color bgColor,
    required Color textColor,
    IconData? icon,
  }) {
    FToast fToast = FToast();
    fToast.init(context);

    fToast.showToast(
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) Icon(icon, color: textColor, size: 20),
            if (icon != null) const SizedBox(width: 12.0),
            Flexible(
              child: AppText(
                message,
                size: TextSize.xl,
                color: textColor,
                weight: AppFontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
