import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/extension/text_style_extension.dart';
import '../../../../core/widgets/app_text_widget.dart';

class MonthViewText extends StatelessWidget {
  const MonthViewText({super.key, required this.monthName});

  final String monthName;

  @override
  Widget build(BuildContext context) {
    return AppText(
      monthName,
      size: TextSize.lg,
      weight: AppFontWeight.bold,
      color: AppColors.textGreenColor,
    );
  }
}
