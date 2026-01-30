import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class AppSwitchBtn extends StatelessWidget {
  const AppSwitchBtn({
    super.key,
    this.title,
    required this.value,
    required this.onChanged,
  });

  final String? title;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: title != null
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textGreenColor,
            ),
          ),
        Switch(
          padding: EdgeInsets.zero,
          trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
          value: value,
          onChanged: (val) {
            onChanged(val);
          },
          thumbColor: WidgetStatePropertyAll(AppColors.honeydewGreen),
          activeTrackColor: AppColors.caribbeanGreen,
          inactiveTrackColor: AppColors.caribbeanGreen.withValues(alpha: .5),
        ),
      ],
    );
  }
}
