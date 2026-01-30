import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class SearchBtn extends StatelessWidget {
  const SearchBtn({
    super.key,
    required this.title,
    required this.onPressed,
    this.applyTextColor = false,
  });

  final String title;
  final Function() onPressed;
  final bool applyTextColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        minimumSize: const Size(170, 30),
        backgroundColor: applyTextColor
            ? AppColors.lightGreen
            : AppColors.caribbeanGreen,
      ),
      child: Text(
        title,
        style: TextStyle(color: applyTextColor ? AppColors.fenceGreen : null),
      ),
    );
  }
}
