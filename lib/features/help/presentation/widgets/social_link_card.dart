import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';
import '../../../customer_service/presentation/view/customer_service_screen.dart';
import '../../data/model/social_link_model.dart';

class SocialLinkCard extends StatelessWidget {
  const SocialLinkCard({super.key, required this.socialLinkModel});

  final SocialLinkModel socialLinkModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          _handleTap(context, socialLinkModel.id);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.caribbeanGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ImageViewer(
                    imagePath: socialLinkModel.icon,
                    fit: BoxFit.contain,
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  socialLinkModel.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textGreenColor,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: AppColors.textGreenColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap(BuildContext context, String id) {
    switch (id) {
      case 'customer-service':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomerServiceScreen()),
        );
        break;
      case 'website':
        break;
      case 'facebook':
        break;
      case 'whatsapp':
        break;
      case 'instagram':
        break;
    }
  }
}
