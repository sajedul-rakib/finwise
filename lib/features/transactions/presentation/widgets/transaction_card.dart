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
                  Text(
                    "Salary",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.fenceGreen,
                    ),
                  ),
                  Text(
                    "18:27 - April 30",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.oceanBlue,
                    ),
                  ),
                ],
              ),
              ImageViewer(imagePath: 'assets/images/icons/green_line.png'),
            ],
          ),
          Text(
            'Monthly',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.fenceGreen,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            spacing: 10,
            children: [
              ImageViewer(imagePath: 'assets/images/icons/green_line.png'),
              Text(
                '\$4.000,00',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.fenceGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
