import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class StatsContainer extends StatelessWidget {
  const StatsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.honeydewGreen,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        spacing: 5,
        children: [
          AppText(
            "Total Balance",
            size: TextSize.xl,
            weight: AppFontWeight.bold,
            color: AppColors.textGreenColor,
          ),
          AppText(
            '\$7,783.00',
            size: TextSize.xxxl,
            weight: AppFontWeight.extraBold,
            color: AppColors.textGreenColor,
          ),
        ],
      ),
    );
  }
}
