import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/auth_state.dart';
import 'auth_provider.dart';

// The Notifier class
class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    // Initial state is 'initial' (Splash)
    // We trigger the check as soon as the provider is first read
    _checkStatus();
    return AuthState.unknown;
  }

  Future<void> _checkStatus() async {
    // Artificial delay for splash screen branding
    await Future.delayed(const Duration(seconds: 2));

    // Read the use case through the internal 'ref'
    final checkAuthUseCase = ref.read(checkAuthStatusUseCaseProvider);

    try {
      final result = await checkAuthUseCase.checkStatus();

      state = result;
    } catch (e) {
      state = AuthState.unauthenticated;
    }
  }

  // Future<void> logout() async {
  //   final signOutUseCase = ref.read(signOutUseCaseProvider);
  //   await signOutUseCase.execute();
  //   state = AuthState.unauthenticated;
  // }
}

// The modern NotifierProvider
final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
