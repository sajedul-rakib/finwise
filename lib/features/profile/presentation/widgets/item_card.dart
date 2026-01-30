import 'package:finwise/features/help/presentation/view/help_screen.dart';
import 'package:finwise/features/login/presentation/widgets/logout_dialog.dart';
import 'package:finwise/features/profile/presentation/view/security_screen.dart';
import 'package:finwise/features/profile/presentation/view/settings_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';
import '../../data/models/screen_item_model.dart';
import '../view/edit_profile_screen.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.screenItemModel});

  final ScreenItemModel screenItemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleTap(context, screenItemModel.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          spacing: 15,
          children: [
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.vividBlue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ImageViewer(
                imagePath: screenItemModel.icon,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              screenItemModel.title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: AppColors.textGreenColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap(BuildContext context, String id) {
    switch (id) {
      case "edit-profile":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditProfileScreen()),
        );
        break;
      case "security":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SecurityScreen()),
        );
        break;
      case "settings":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()),
        );
        break;
      case "help":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HelpScreen()),
        );
        break;
      case "logout":
        showLogoutDialog(context);
        break;
    }
  }
}
