import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          spacing: 3,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.caribbeanGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ImageViewer(
                  imagePath: 'assets/images/icons/bell.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reminder",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.fenceGreen,
                    ),
                  ),
                  Text(
                    "Set up your automatic savings to meet your savings goal",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.fenceGreen,
                      fontFamily: GoogleFonts.leagueSpartan().fontFamily,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            Text(
              "4:24 - April 20",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w200,
                color: AppColors.oceanBlue,
              ),
              textAlign: TextAlign.end,
            ),
          ],
        ),
        const SizedBox(height: 20),
        ImageViewer(imagePath: 'assets/images/icons/green_line_H.png'),
      ],
    );
  }
}
