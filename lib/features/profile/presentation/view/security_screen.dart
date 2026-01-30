import 'package:finwise/core/constant/app_colors.dart';
import 'package:finwise/features/finger/presentation/view/fingerprint_screen.dart';
import 'package:finwise/features/profile/presentation/view/terms_condition_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/security_item.dart';
import '../../../password/presentation/view/change_pin_screen.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Security"), centerTitle: true),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Security",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textGreenColor,
              ),
            ),
            const SizedBox(height: 20),
            SecurityItem(
              title: "Change Pin",
              showUnderBorder: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePinScreen(),
                  ),
                );
              },
            ),
            SecurityItem(
              title: "Fingerprint",
              showUnderBorder: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FingerprintScreen(),
                  ),
                );
              },
            ),
            SecurityItem(
              title: "Terms And Conditions",
              showUnderBorder: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsConditionScreen(),
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
