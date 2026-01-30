import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/app_btn.dart';
import 'package:finwise/core/widgets/image_viewer.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/success_message_screen.dart';

class UserFingerprintScreen extends StatelessWidget {
  const UserFingerprintScreen({super.key, required this.whoFingerprint});

  final String whoFingerprint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(whoFingerprint), centerTitle: true),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 30, right: 30),
        decoration: BoxDecoration(
          color: AppColors.honeydewGreen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.caribbeanGreen,
                shape: BoxShape.circle,
              ),
              child: ImageViewer(
                imagePath: 'assets/images/icons/fingerprint.png',
                width: 120,
                height: 120,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                whoFingerprint,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textGreenColor,
                ),
              ),
            ),
            const SizedBox(height: 60),
            AppButton(
              title: "Delete",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessMessageScreen(
                      successMessage:
                          "The Fingerprint Has Been Successfully Deleted.",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
