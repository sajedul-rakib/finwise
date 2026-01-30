import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';
import 'auth_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthScreen()),
      );
    });

    return Scaffold(
      backgroundColor: AppColors.caribbeanGreen,
      body: Center(
        child: ImageViewer(
          imagePath: 'assets/images/logo/logo_black.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
