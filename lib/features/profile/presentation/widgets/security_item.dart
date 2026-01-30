import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';

class SecurityItem extends StatelessWidget {
  const SecurityItem({
    super.key,
    this.onTap,
    required this.title,
    this.iconWidgets,
    this.showUnderBorder = false,
  });

  final Function()? onTap;
  final String title;
  final Widget? iconWidgets;
  final bool showUnderBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          spacing: showUnderBorder ? 15 : 0,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: iconWidgets == null ? 0 : 15,
                  children: [
                    if (iconWidgets != null) iconWidgets!,
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textGreenColor,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.textGreenColor,
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            if (showUnderBorder)
              ImageViewer(
                imagePath: 'assets/images/icons/green_line_H.png',
                fit: BoxFit.fitWidth,
                color: AppColors.lightGreen,
              ),
          ],
        ),
      ),
    );
  }
}
