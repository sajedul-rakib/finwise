import 'package:finwise/features/splash/domain/entities/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../splash/presentation/riverpod/auth_controller.dart';
import '../../domain/usecase/login_use_case.dart';

class LoginController extends StateNotifier<AsyncValue<AuthState>> {
  final LoginUseCase _loginUseCase;
  final Ref _ref;

  LoginController(this._loginUseCase, this._ref)
    : super(const AsyncData(AuthState.unknown));

  Future<AuthState> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      final result = await _loginUseCase.execute(email, password);
      state = AsyncData(result);

      // Update global auth status
      await _ref.read(authNotifierProvider.notifier).checkStatus();

      return result; // Return the actual result (authenticated/unauthenticated)
    } catch (e, stack) {
      state = AsyncError(e, stack);
      return AuthState.unauthenticated; // Return a fallback state on error
    }
  }
}
