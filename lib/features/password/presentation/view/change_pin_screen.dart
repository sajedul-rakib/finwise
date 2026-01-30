import 'package:finwise/core/widgets/form_input.dart';
import 'package:finwise/core/widgets/success_message_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/app_btn.dart';

class ChangePinScreen extends StatelessWidget {
  const ChangePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Pin"), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        decoration: BoxDecoration(
          color: AppColors.honeydewGreen,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Column(
          spacing: 30,
          children: [
            FormInput(
              hintText: "● ● ● ●",
              labelText: "Current Pin",
              suffixIcon: Icon(Icons.remove_red_eye),
            ),
            FormInput(
              hintText: "● ● ● ●",
              labelText: "New Pin",
              suffixIcon: Icon(Icons.remove_red_eye),
            ),
            FormInput(
              hintText: "● ● ● ●",
              labelText: "Confirm Pin",
              suffixIcon: Icon(Icons.remove_red_eye),
            ),
            AppButton(
              title: "Change Pin",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SuccessMessageScreen(
                      successMessage: "Pin Has Been Changed Successfully",
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
