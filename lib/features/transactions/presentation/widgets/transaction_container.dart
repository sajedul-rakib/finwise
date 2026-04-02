import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';

class TransactionContainer extends StatelessWidget {
  const TransactionContainer({
    super.key,
    required this.imagePath,
    required this.title,
    required this.amount,
  });

  final String imagePath;
  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.honeydewGreen,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            width: 25,
            height: 25,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(
                color: title.toLowerCase() == 'expense'
                    ? AppColors.oceanBlue
                    : AppColors.caribbeanGreen,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ImageViewer(
              color: title.toLowerCase() == 'expense'
                  ? AppColors.oceanBlue
                  : AppColors.caribbeanGreen,
              width: 25,
              height: 25,
              imagePath: imagePath,
            ),
          ),
          AppText(
            title,

            size: TextSize.xl,
            weight: AppFontWeight.bold,
            color: AppColors.fenceGreen,
          ),
          AppText(
            "\$$amount",

            size: TextSize.xxl,
            weight: AppFontWeight.bold,
            color: title.toLowerCase() == 'expense'
                ? AppColors.oceanBlue
                : AppColors.fenceGreen,
          ),
        ],
      ),
    );
  }
}
