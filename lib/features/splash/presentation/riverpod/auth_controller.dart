import 'package:finwise/core/service/database/local_database_service.dart';
import 'package:finwise/features/category/presentation/riverpod/category_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/auth_state.dart';
import 'auth_provider.dart';

// The Notifier class
class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    // Initial state is 'initial' (Splash)
    // We trigger the check as soon as the provider is first read
    checkStatus();
    return AuthState.unknown;
  }

  Future<void> checkStatus() async {
    // Artificial delay for splash screen branding
    await Future.delayed(const Duration(seconds: 2));

    // Read the use case through the internal 'ref'
    final checkAuthUseCase = ref.read(checkAuthStatusUseCaseProvider);

    try {
      final result = await checkAuthUseCase.checkStatus();
      state = result;
    } catch (e) {
      logout();
      state = AuthState.unauthenticated;
    }
  }

  Future<void> logout() async {
    await LocalDatabase.instance.deleteDatabaseFile();
    ref.invalidate(categoryStateProvider);
    final signOutUseCase = ref.read(signOutUseCaseProvider);
    final res = await signOutUseCase.call();
    state = res;
  }
}

// Thea NotifierProvider
final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
