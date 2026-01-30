import 'package:finwise/features/login/presentation/view/security_fingerprint_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/form_input.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

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
                    'New Password',
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
                  FormInput(
                    labelText: 'Password',
                    hintText: "● ● ● ● ● ● ● ●",
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.textGreenColor,
                    ),
                  ),
                  const SizedBox(height: 40),
                  FormInput(
                    labelText: 'Confirm Password',
                    hintText: "● ● ● ● ● ● ● ●",
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.textGreenColor,
                    ),
                  ),
                  const SizedBox(height: 80),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 40),
                      maximumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecurityFingerprintScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Change Password',
                      style: TextStyle(
                        color: AppColors.textGreenColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
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
