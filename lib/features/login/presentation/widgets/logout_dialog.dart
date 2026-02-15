import 'package:finwise/features/splash/presentation/riverpod/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/app_btn.dart';

void showLogoutDialog(BuildContext context) {
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
              spacing: 40,
              children: [
                Column(
                  spacing: 10,
                  children: [
                    Text(
                      "End Session",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.fenceGreen,
                      ),
                    ),
                    Text(
                      "Are you sure you want to log out?",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                Column(
                  spacing: 10,
                  children: [
                    Consumer(
                      builder: (BuildContext context, WidgetRef ref, _) {
                        return AppButton(
                          onPressed: () {
                            ref.read(authNotifierProvider.notifier).logout();
                            Navigator.pop(context);
                          },
                          title: "Yes, End Session",
                          textStyle: TextStyle(
                            fontSize: 15,
                            color: AppColors.fenceGreen,
                          ),
                        );
                      },
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
