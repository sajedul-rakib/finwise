import 'package:finwise/core/widgets/image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';

class SecurityFingerprintScreen extends StatelessWidget {
  const SecurityFingerprintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SafeArea(
              child: Center(
                child: SizedBox(
                  width: 300,
                  child: Text(
                    'Security Fingerprint',
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
            flex: 10,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  ImageViewer(
                    imagePath: 'assets/images/icons/fingerprint.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 80),

                  Text(
                    'Use fingerprint  to access',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.cyprusGreen,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 310,
                    height: 60,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: GoogleFonts.leagueSpartan().fontFamily,
                        color: AppColors.textGreenColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                      maximumSize: Size(double.infinity, 50),
                      backgroundColor: AppColors.lightGreen,
                      textStyle: TextStyle(color: AppColors.cyprusGreen),
                    ),

                    child: Text(
                      'Use Touch Id',
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.cyprusGreen,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      maximumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {},
                    child: Text(
                      '¿Or prefer use pin code?',
                      style: TextStyle(
                        fontFamily: GoogleFonts.leagueSpartan().fontFamily,
                        color: AppColors.textGreenColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
