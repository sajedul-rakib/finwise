import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/app_btn.dart';

void showConfirmDialog(BuildContext context) {
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
              spacing: 30,
              children: [
                Text(
                  "Delete Account",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.fenceGreen,
                  ),
                ),
                Text(
                  "Are you sure you want to log out?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  "By deleting your account, you agree that you understand the consequences of this action and that you agree to permanently delete your account and all associated data.",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: GoogleFonts.leagueSpartan().fontFamily,
                    color: Color(0xff313036),
                  ),
                  textAlign: TextAlign.center,
                ),
                Column(
                  spacing: 10,
                  children: [
                    AppButton(
                      onPressed: () => Navigator.pop(context),
                      title: "Yes, Delete Account",
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: AppColors.fenceGreen,
                      ),
                    ),
                    AppButton(
                      onPressed: () => Navigator.pop(context),
                      title: "Cancel",
                      bgColor: AppColors.lightGreen,
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: AppColors.textGreenColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
