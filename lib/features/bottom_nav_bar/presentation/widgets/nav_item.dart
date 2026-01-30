import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';

class NavItem extends StatelessWidget {
  const NavItem({super.key, required this.imagePath, required this.isSelected});

  final String imagePath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 40,
      width: 40,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.caribbeanGreen : null,
        borderRadius: BorderRadius.circular(15),
      ),

      child: ImageViewer(
        imagePath: imagePath,
        width: 40,
        height: 40,
        fit: BoxFit.contain,
      ),
    );
  }
}
