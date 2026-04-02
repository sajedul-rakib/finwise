import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:finwise/core/widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/app_colors.dart';

class SavingsTargetCard extends StatelessWidget {
  const SavingsTargetCard({
    super.key,
    required this.targetName,
    required this.targetProgress,
    required this.icon,
  });

  final String targetName;
  final double targetProgress;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
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
                  value: targetProgress,
                  strokeCap: StrokeCap.round,
                  backgroundColor: AppColors.lightGreen,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.textGreenColor,
                  ),
                  strokeWidth: 5,
                ),
              ),
              SvgPicture.asset(
                'assets/category-icons/$icon',
                colorFilter: ColorFilter.mode(
                  AppColors.fenceGreen,
                  BlendMode.srcIn,
                ),
                width: 55,
                height: 55,
                fit: BoxFit.contain,
              ),
            ],
          ),
          AppText(
            targetName,
            size: TextSize.xl,
            weight: AppFontWeight.bold,
            color: AppColors.textGreenColor,
          ),
        ],
      ),
    );
  }
}
