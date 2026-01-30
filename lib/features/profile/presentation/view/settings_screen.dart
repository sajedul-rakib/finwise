import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/image_viewer.dart';
import 'package:finwise/features/login/presentation/view/delete_account_screen.dart';
import 'package:finwise/features/notification/presentation/view/notification_settings.dart';
import 'package:finwise/features/password/presentation/view/password_settings_screen.dart';
import 'package:finwise/features/profile/presentation/widgets/security_item.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Container(
        padding: EdgeInsets.only(top: 40, right: 30, left: 30),
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
                    builder: (context) => NotificationSettings(),
                  ),
                );
              },
              title: "Notification Settings",
              iconWidgets: _buildIcon('assets/images/icons/bell.png'),
            ),
            SecurityItem(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasswordSettingsScreen(),
                  ),
                );
              },
              title: "Password Settings",
              iconWidgets: _buildIcon('assets/images/icons/key.png'),
            ),
            SecurityItem(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeleteAccountScreen(),
                  ),
                );
              },
              title: "Delete Account",
              iconWidgets: _buildIcon('assets/images/icons/user.png'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String iconUrl) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.caribbeanGreen,
      ),
      padding: EdgeInsets.all(5),
      child: ImageViewer(
        imagePath: iconUrl,
        width: 30,
        height: 30,
        color: AppColors.textGreenColor,
      ),
    );
  }
}
