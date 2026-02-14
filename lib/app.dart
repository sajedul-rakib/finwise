import 'package:finwise/features/bottom_nav_bar/presentation/view/app_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constant/app_string.dart';
import 'core/theme/theme.dart';
import 'features/onboarding/presentation/view/onboarding_screen.dart';
import 'features/password/presentation/view/pin_screen.dart';
import 'features/splash/domain/entities/auth_state.dart';
import 'features/splash/presentation/riverpod/auth_controller.dart';
import 'features/splash/presentation/view/auth_screen.dart';
import 'features/splash/presentation/view/splash_screen.dart';

class FinWiseApp extends ConsumerWidget {
  const FinWiseApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the auth status
    final authStatus = ref.watch(authNotifierProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: _getHome(authStatus),
    );
  }

  Widget _getHome(AuthState status) {
    switch (status) {
      case AuthState.unknown:
        return const SplashScreen();
      case AuthState.pinRequired:
        return const PinScreen();
      case AuthState.onboarding:
        return const OnboardingScreen();
      case AuthState.authenticated:
        return const AppBottomNavBar();
      case AuthState.unauthenticated:
        return const AuthScreen();
    }
  }
}
