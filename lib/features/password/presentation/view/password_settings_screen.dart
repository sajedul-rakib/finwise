import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/app_btn.dart';
import 'package:finwise/core/widgets/form_input.dart';
import 'package:finwise/core/widgets/success_message_screen.dart';
import 'package:flutter/material.dart';

class PasswordSettingsScreen extends StatelessWidget {
  const PasswordSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Password Settings")),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 60, right: 30, left: 30),
        decoration: BoxDecoration(
          color: AppColors.honeydewGreen,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  children: [
                    FormInput(
                      hintText: "● ● ● ● ● ● ● ●",
                      labelText: "Current Password",
                    ),
                    FormInput(
                      hintText: "● ● ● ● ● ● ● ●",
                      labelText: "New Password",
                    ),
                    FormInput(
                      hintText: "● ● ● ● ● ● ● ●",
                      labelText: "Confirm Password",
                    ),
                    const SizedBox(height: 20),
                    AppButton(
                      title: "Change Password",
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SuccessMessageScreen(
                              successMessage:
                                  "Password Has Been Changed Successfully",
                            ),
                          ),
                        );
                      },
                      textStyle: TextStyle(
                        color: AppColors.textGreenColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
