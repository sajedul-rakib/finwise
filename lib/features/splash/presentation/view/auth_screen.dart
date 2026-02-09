import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/image_viewer.dart';
import 'package:finwise/features/login/presentation/view/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../login/presentation/view/login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode
          ? AppColors.fenceGreen
          : AppColors.honeydewGreen,
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
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDarkMode
                    ? AppColors.lightGreen
                    : AppColors.textGreenColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text(
              'Log In',
              style: TextStyle(
                color: AppColors.textGreenColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightGreen,
              textStyle: TextStyle(color: AppColors.cyprusGreen),
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.cyprusGreen,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
              );
            },
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                fontFamily: GoogleFonts.leagueSpartan().fontFamily,
                color: isDarkMode
                    ? AppColors.lightGreen
                    : AppColors.textGreenColor,
                fontWeight: FontWeight.w900,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
