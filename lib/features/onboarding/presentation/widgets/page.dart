import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.description,
    required this.imagePath,
    this.onPressed,
  });

  final String description;
  final String imagePath;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    log(description);
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: SafeArea(
            child: Center(
              child: SizedBox(
                width: 300,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.cyprusGreen,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.honeydewGreen,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        color: AppColors.lightGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                    ImageViewer(
                      imagePath: imagePath,
                      width: 290,
                      height: 290,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
