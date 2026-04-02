import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/utils/extension/string_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/app_text_widget.dart';

class SavingsCard extends StatelessWidget {
  const SavingsCard({
    super.key,
    required this.icon,
    required this.savingsTitle,
    required this.createAt,
    required this.savingsAmount,
  });

  final String icon;
  final String savingsTitle;
  final String createAt;
  final String savingsAmount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),

              child: SvgPicture.asset(
                'assets/category-icons/$icon',
                colorFilter: ColorFilter.mode(
                  AppColors.fenceGreen,
                  BlendMode.srcIn,
                ),
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                AppText(
                  savingsTitle,
                  size: TextSize.xl,
                  weight: AppFontWeight.bold,
                  color: AppColors.fenceGreen,
                ),
                AppText(
                  createAt.formatDate(createAt),
                  size: TextSize.sm,
                  weight: AppFontWeight.extraBold,
                  color: AppColors.oceanBlue,
                ),
              ],
            ),
          ],
        ),
        AppText(
          '\$$savingsAmount',
          size: TextSize.xl,
          weight: AppFontWeight.bold,
          color: AppColors.fenceGreen,
        ),
      ],
    );
  }
}
