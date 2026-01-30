import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/core/widgets/app_btn.dart';
import 'package:finwise/core/widgets/form_input.dart';
import 'package:finwise/features/login/presentation/widgets/confirm_dialog.dart';
import 'package:flutter/material.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delete Account")),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 40, right: 30, left: 30),
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        spacing: 30,
                        children: [
                          Text(
                            "Are You Sure You Want To Delete Your Account?",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff363130),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.lightGreen,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "This action will permanently delete all of your data, and you will not be able to recover it. Please keep the following in mind before proceeding:",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff363130),
                                  ),
                                ),
                                _buildBulletPoint(
                                  "All your expenses, income and associated transactions will be eliminated.",
                                ),
                                _buildBulletPoint(
                                  "You will not be able to access your account or any related information.",
                                ),
                                _buildBulletPoint(
                                  " This action cannot be undone.",
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Please enter your password to confirm deletion of your account.",
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.textGreenColor,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    FormInput(
                      hintText: "● ● ● ● ● ● ● ●",
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                    const SizedBox(height: 30),
                    AppButton(
                      title: "Yes, Delete Account",
                      onPressed: () {
                        showConfirmDialog(context);
                      },
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: AppColors.textGreenColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    AppButton(
                      title: "Cancel",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      bgColor: AppColors.lightGreen,
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: AppColors.fenceGreen,
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

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "• ",
            style: TextStyle(fontSize: 13, color: Color(0xff313630)),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 13, color: Color(0xff313630)),
            ),
          ),
        ],
      ),
    );
  }
}
