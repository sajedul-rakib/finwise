import 'package:finwise/core/widgets/image_viewer.dart';
import 'package:finwise/features/login/presentation/view/password_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../signup/presentation/view/signup_screen.dart';

class SecurityPinScreen extends StatelessWidget {
  const SecurityPinScreen({super.key});

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
                    'Security pin',
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    Text(
                      "Enter Security Pin",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 60),
                    Pinput(
                      length: 6,
                      obscureText: true,
                      focusedPinTheme: PinTheme(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: AppColors.cyprusGreen,
                            width: 3,
                          ),
                        ),
                      ),
                      defaultPinTheme: PinTheme(
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: AppColors.textGreenColor,
                          fontWeight: FontWeight.w700,
                        ),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: AppColors.caribbeanGreen,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 20,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Accept',
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
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightGreen,
                            textStyle: TextStyle(color: AppColors.cyprusGreen),
                          ),

                          child: Text(
                            'Send Again',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.cyprusGreen,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 80),
                        Text(
                          'or sign up with',
                          style: TextStyle(
                            color: AppColors.textGreenColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 20,
                          children: [
                            ImageViewer(
                              imagePath: 'assets/images/icons/Facebook.png',
                              width: 35,
                              height: 35,
                            ),
                            ImageViewer(
                              imagePath: 'assets/images/icons/Google.png',
                              width: 35,
                              height: 35,
                            ),
                          ],
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            maximumSize: Size(double.infinity, 50),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Don’t have an account? ',
                              style: TextStyle(
                                fontFamily:
                                    GoogleFonts.leagueSpartan().fontFamily,
                                color: AppColors.textGreenColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.leagueSpartan().fontFamily,
                                    color: AppColors.vividBlue,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
