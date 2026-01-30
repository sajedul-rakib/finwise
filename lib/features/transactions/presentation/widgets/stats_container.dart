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
          Text(
            "Total Balance",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textGreenColor,
            ),
          ),
          Text(
            '\$7,783.00',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.textGreenColor,
            ),
          ),
        ],
      ),
    );
  }
}
