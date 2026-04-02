import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class TargetCard extends StatelessWidget {
  const TargetCard({
    super.key,
    required this.targetName,
    required this.targetAmount,
    required this.targetProgress,
  });

  final String targetName;
  final double targetAmount;
  final String targetProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        spacing: 10,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  value: targetAmount,
                  strokeCap: StrokeCap.round,
                  backgroundColor: AppColors.lightGreen,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.oceanBlue,
                  ),
                  strokeWidth: 5,
                ),
              ),
              AppText(
                targetProgress,

                size: TextSize.xxl,
                weight: AppFontWeight.extraBold,
                color: AppColors.lightGreen,
              ),
            ],
          ),
          AppText(
            targetName,

            size: TextSize.xl,
            weight: AppFontWeight.bold,
            color: AppColors.lightGreen,
          ),
        ],
      ),
    );
  }
}
