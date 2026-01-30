import 'package:flutter/material.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 5,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: AppColors.cyprusGreen,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.arrow_upward,
                          size: 10,
                          color: AppColors.cyprusGreen,
                        ),
                      ),
                      Text(
                        "Total Balance",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: AppColors.textGreenColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '\$7,783.00',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.honeydewGreen,
                    ),
                  ),
                ],
              ),

              ImageViewer(imagePath: 'assets/images/icons/line.png'),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 5,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: AppColors.cyprusGreen,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.arrow_downward,
                          size: 10,
                          color: AppColors.cyprusGreen,
                        ),
                      ),
                      Text(
                        "Total Expense",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: AppColors.textGreenColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '-\$7,783.00',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.oceanBlue,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),
          Column(
            children: [
              LinearProgressIndicator(
                value: 0.3,
                backgroundColor: AppColors.cyprusGreen,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.honeydewGreen,
                ),
                minHeight: 20,
                borderRadius: BorderRadius.circular(10),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                spacing: 5,

                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: AppColors.cyprusGreen,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Icon(
                      Icons.check,
                      size: 12,
                      color: AppColors.cyprusGreen,
                    ),
                  ),
                  Text(
                    '30% of your expenses, looks good.',

                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: AppColors.cyprusGreen,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
