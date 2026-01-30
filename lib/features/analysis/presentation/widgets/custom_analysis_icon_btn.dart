import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class CAIconButton extends StatelessWidget {
  const CAIconButton({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: AppColors.caribbeanGreen,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: AppColors.textGreenColor),
      ),
    );
  }
}
