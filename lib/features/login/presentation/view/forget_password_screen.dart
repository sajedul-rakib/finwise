import 'package:finwise/core/widgets/image_viewer.dart';
import 'package:finwise/features/login/presentation/view/security_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/form_input.dart';
import '../../../signup/presentation/view/signup_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
                    'Forgot Password',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    Text(
                      "Reset Password?",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: AppColors.cyprusGreen,
                        fontWeight: FontWeight.normal,
                        fontFamily: GoogleFonts.leagueSpartan().fontFamily,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 40),
                    FormInput(
                      hintText: "example@gmail.com",
                      labelText: "Enter Email Address",
                    ),
                    const SizedBox(height: 30),
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
                                builder: (context) => SecurityPinScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Next Step',
                            style: TextStyle(
                              color: AppColors.textGreenColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),

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
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.cyprusGreen,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),

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
