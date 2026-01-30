import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/form_input.dart';
import '../../../login/presentation/view/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: SafeArea(
              child: Center(
                child: SizedBox(
                  width: 300,
                  child: Text(
                    'Create account',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    FormInput(hintText: "John Doe", labelText: "Full Name"),
                    const SizedBox(height: 10),
                    FormInput(
                      hintText: "example@gmail.com",
                      labelText: "Email",
                    ),
                    const SizedBox(height: 10),
                    FormInput(
                      hintText: "+880 1434-567890",
                      labelText: "Mobile Number",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    FormInput(
                      hintText: "DD/MM/YYYY",
                      labelText: "Date of Birth",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    FormInput(
                      labelText: 'Password',
                      hintText: "● ● ● ● ● ● ● ●",
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColors.textGreenColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    FormInput(
                      labelText: 'Confirm Password',
                      hintText: "● ● ● ● ● ● ● ●",
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColors.textGreenColor,
                      ),
                    ),
                    const SizedBox(height: 10),

                    TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(220, 50),
                        maximumSize: Size(230, 50),
                      ),
                      onPressed: () {},
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'By continuing, you agree to',
                          style: TextStyle(
                            color: Color(0xff4B4544),
                            fontWeight: FontWeight.normal,
                            fontFamily: GoogleFonts.leagueSpartan().fontFamily,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: ' Terms of Use',
                              style: TextStyle(
                                color: Color(0xff4B4544),
                                fontWeight: FontWeight.bold,
                                fontFamily:
                                    GoogleFonts.leagueSpartan().fontFamily,

                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: ' and',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff4B4544),
                                fontFamily:
                                    GoogleFonts.leagueSpartan().fontFamily,

                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: ' Privacy Policy.',
                              style: TextStyle(
                                color: Color(0xff4B4544),
                                fontFamily:
                                    GoogleFonts.leagueSpartan().fontFamily,

                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.textGreenColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
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
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            fontFamily: GoogleFonts.leagueSpartan().fontFamily,
                            color: AppColors.textGreenColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                          children: [
                            TextSpan(
                              text: 'Log In',
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
                    const SizedBox(height: 20),
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
