import 'package:finwise/features/onboarding/presentation/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';
import '../../../password/presentation/view/pin_screen.dart';
import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = Hive.box('settings');

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => box.get('hasPin', defaultValue: false)
              ? PinScreen()
              : box.get('isFirstOpen', defaultValue: false)
              ? OnboardingScreen()
              : const AuthScreen(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.caribbeanGreen,
      body: Center(
        child: ImageViewer(
          imagePath: 'assets/images/logo/logo_black.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
