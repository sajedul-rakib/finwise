import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/app_btn.dart';
import '../../../../core/widgets/form_input.dart';

void showAddDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 40,
        ),
        backgroundColor: AppColors.honeydewGreen,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 20,
              children: [
                Text(
                  "New Category",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.fenceGreen,
                  ),
                ),
                FormInput(
                  hintText: "Write ...",
                  hintColor: AppColors.caribbeanGreen,
                ),
                AppButton(
                  title: "Save",
                  onPressed: () => Navigator.pop(context),
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textGreenColor,
                  ),
                ),
                AppButton(
                  onPressed: () => Navigator.pop(context),
                  title: "Cancel",
                  bgColor: AppColors.lightGreen,
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textGreenColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
