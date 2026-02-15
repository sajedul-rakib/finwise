import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/bottom_nav_bar/presentation/view/app_bottom_nav_bar.dart';
import '../../features/onboarding/presentation/view/onboarding_screen.dart';
import '../../features/password/presentation/view/pin_screen.dart';
import '../../features/splash/domain/entities/auth_state.dart';
import '../../features/splash/presentation/riverpod/auth_controller.dart';
import '../../features/splash/presentation/view/auth_screen.dart';
import '../../features/splash/presentation/view/splash_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: AuthListenable(ref),
    redirect: (context, state) {
      final authState = ref.read(authNotifierProvider);
      final path = state.uri.path;

      log("The auth state is $authState and current path is $path");

      // 1. If still loading data, stay at splash
      if (authState == AuthState.unknown) return '/splash';

      // 2. Priority Redirects (Onboarding & Pin)
      if (authState == AuthState.onboarding && path != '/onboarding') {
        return '/onboarding';
      }
      if (authState == AuthState.pinRequired && path != '/pin') return '/pin';

      // 3. Define page types
      // Remove '/splash' from public pages because no one should stay there after init
      final isAuthPage = path == '/auth' || path == '/onboarding';

      // 4. Authenticated Logic
      if (authState == AuthState.authenticated) {
        // If logged in, move from splash/auth/onboarding to home
        return (path == '/splash' || isAuthPage) ? '/home' : null;
      }

      // 5. Unauthenticated Logic
      if (authState == AuthState.unauthenticated) {
        // If not on the auth page, force them there (including from splash)
        return path == '/auth' ? null : '/auth';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(path: '/auth', builder: (context, state) => const AuthScreen()),
      GoRoute(
        path: '/home',
        builder: (context, state) => const AppBottomNavBar(),
      ),
      GoRoute(path: '/pin', builder: (context, state) => const PinScreen()),
    ],
  );
});

class AuthListenable extends ChangeNotifier {
  AuthListenable(Ref ref) {
    ref.listen(authNotifierProvider, (previous, next) {
      notifyListeners(); // Trigger GoRouter redirect logic
    });
  }
}
