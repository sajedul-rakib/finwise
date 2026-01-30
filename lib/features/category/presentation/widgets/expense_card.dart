import 'package:finwise/core/utils/extension/string_extenstion.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
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
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(20),
              ),

              child: ImageViewer(
                imagePath: icon,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
                color: AppColors.whiteColor,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                Text(
                  savingsTitle,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: AppColors.fenceGreen,
                  ),
                ),
                Text(
                  createAt.formatDate(createAt),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: AppColors.oceanBlue,
                  ),
                ),
              ],
            ),
          ],
        ),

        Text(
          '-\$$savingsAmount',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.oceanBlue,
          ),
        ),
      ],
    );
  }
}
