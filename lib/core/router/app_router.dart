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

      // 1. Handle Initialization
      if (authState == AuthState.unknown) return '/splash';

      // 2. Define page types
      final isPublicPage =
          path == '/login' || path == '/splash' || path == '/onboarding';

      // 3. Authenticated Logic
      if (authState == AuthState.authenticated) {
        // If logged in, don't allow staying on splash/login/onboarding
        return isPublicPage ? '/home' : null;
      }

      // 4. Unauthenticated Logic (LOGOUT happens here)
      if (authState == AuthState.unauthenticated) {
        // If not logged in and trying to access a private page, force to login
        return isPublicPage ? null : '/login';
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
      GoRoute(path: '/login', builder: (context, state) => const AuthScreen()),
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
