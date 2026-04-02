import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key, this.hasBackground = false});

  final bool hasBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: hasBackground
          ? BoxDecoration(
              color: AppColors.lightGreen,
              borderRadius: BorderRadius.circular(20),
            )
          : null,
      child: Row(
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
                  imagePath: 'assets/images/icons/dollar.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    "Salary",
                    size: TextSize.lg,
                    weight: AppFontWeight.bold,
                    color: AppColors.fenceGreen,
                  ),
                  AppText(
                    "18:27 - April 30",
                    size: TextSize.sm,
                    weight: AppFontWeight.extraBold,
                    color: AppColors.oceanBlue,
                  ),
                ],
              ),
              ImageViewer(imagePath: 'assets/images/icons/green_line.png'),
            ],
          ),
          AppText(
            'Monthly',
            size: TextSize.lg,
            weight: AppFontWeight.medium,
            color: AppColors.fenceGreen,
            textAlign: TextAlign.center,
          ),
          Row(
            spacing: 10,
            children: [
              ImageViewer(imagePath: 'assets/images/icons/green_line.png'),
              AppText(
                '\$4.000,00',
                size: TextSize.xl,
                weight: AppFontWeight.bold,
                color: AppColors.fenceGreen,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
