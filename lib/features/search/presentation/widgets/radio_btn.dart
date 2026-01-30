import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class RadioBtn extends StatelessWidget {
  const RadioBtn({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: label.toLowerCase(),
      contentPadding: EdgeInsets.zero,
      radioScaleFactor: 1.2,
      radioSide: BorderSide(color: AppColors.caribbeanGreen, width: 2),
      fillColor: WidgetStatePropertyAll(AppColors.caribbeanGreen),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.textGreenColor,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
