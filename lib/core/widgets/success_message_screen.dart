import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/image_viewer.dart';
import 'package:flutter/material.dart';

class SuccessMessageScreen extends StatelessWidget {
  const SuccessMessageScreen({super.key, required this.successMessage});

  final String successMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageViewer(
            imagePath: 'assets/images/icons/circle.png',
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 260,
              height: 60,
              child: Text(
                successMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
