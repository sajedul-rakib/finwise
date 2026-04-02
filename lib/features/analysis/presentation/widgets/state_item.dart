import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';

class StateItem extends StatelessWidget {
  const StateItem({
    super.key,
    required this.label,
    required this.amount,
    required this.iconPath,
    required this.color,
  });

  final String label;
  final String amount;
  final String iconPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            border: Border.all(color: color, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(2),
          child: ImageViewer(
            imagePath: iconPath,
            color: color,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 5),
        AppText(
          label,

          size: TextSize.xl,
          weight: AppFontWeight.bold,
          color: AppColors.textGreenColor,
        ),
        AppText(
          amount,

          size: TextSize.xxl,
          weight: AppFontWeight.extraBold,
          color: color,
        ),
      ],
    );
  }
}
