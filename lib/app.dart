import 'package:flutter/material.dart';

import 'core/constant/app_string.dart';
import 'core/theme/theme.dart';
import 'features/splash/presentation/view/splash_screen.dart';

class FinWise extends StatelessWidget {
  const FinWise({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}
