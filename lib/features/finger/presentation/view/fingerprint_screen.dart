import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/features/finger/presentation/view/add_fingerprint_screen.dart';
import 'package:finwise/features/finger/presentation/view/user_fingerprint_screen.dart';
import 'package:finwise/features/profile/presentation/widgets/security_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/image_viewer.dart';

class FingerprintScreen extends StatelessWidget {
  const FingerprintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fingerprint"), centerTitle: true),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 40, left: 30, right: 30),
        decoration: BoxDecoration(
          color: AppColors.honeydewGreen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            SecurityItem(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserFingerprintScreen(
                      whoFingerprint: "John Fingerprint",
                    ),
                  ),
                );
              },
              title: "John Fingerprint",
              iconWidgets: _buildIcon("assets/images/icons/finger.png"),
            ),
            SecurityItem(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddFingerprintScreen(),
                  ),
                );
              },
              title: "Add Fingerprint",
              iconWidgets: _buildIcon(
                'assets/images/icons/add.png',
                AppColors.oceanBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String iconUrl, [Color? backgroundColor]) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: backgroundColor ?? AppColors.lightBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ImageViewer(imagePath: iconUrl, width: 30, height: 30),
    );
  }
}
