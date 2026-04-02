import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/extension/text_style_extension.dart';
import 'package:finwise/core/widgets/app_text_widget.dart';
import 'package:finwise/core/widgets/image_viewer.dart';
import 'package:finwise/features/login/presentation/view/forget_password_screen.dart';
import 'package:finwise/features/signup/presentation/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../login/presentation/view/login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.honeydewGreen,
      body: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ImageViewer(
              imagePath: 'assets/images/logo/logo_green.png',
              width: 200,
              height: 200,
            ),
          ),
          SizedBox(
            width: 300,
            child: AppText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
              size: TextSize.sm,
              weight: AppFontWeight.medium,
              textAlign: TextAlign.center,
              color: AppColors.textGreenColor,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: AppText(
              'Log In',
              color: AppColors.textGreenColor,
              weight: AppFontWeight.bold,
              size: TextSize.xxl,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightGreen,
              textStyle: TextStyle(color: AppColors.cyprusGreen),
            ),
            child: AppText(
              'Sign Up',
              size: TextSize.xxl,
              color: AppColors.cyprusGreen,
              weight: AppFontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
              );
            },
            child: AppText(
              'Forgot Password?',
              fontFamily: GoogleFonts.leagueSpartan().fontFamily,
              color: AppColors.textGreenColor,
              weight: AppFontWeight.extraBold,
              size: TextSize.xxl,
            ),
          ),
        ],
      ),
    );
  }
}
