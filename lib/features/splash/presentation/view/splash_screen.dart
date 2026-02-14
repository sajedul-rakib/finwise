import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/widgets/image_viewer.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
