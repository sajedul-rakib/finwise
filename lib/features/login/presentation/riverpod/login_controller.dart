import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../splash/presentation/riverpod/auth_controller.dart';
import '../../domain/usecase/login_use_case.dart';

class LoginController extends StateNotifier<AsyncValue<void>> {
  final LoginUseCase _loginUseCase;
  final Ref _ref;

  LoginController(this._loginUseCase, this._ref) : super(const AsyncData(null));

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      await _loginUseCase.execute(email, password);
      state = const AsyncData(null);
      _ref.read(authNotifierProvider.notifier).checkStatus();
    } catch (e, stack) {
      state = AsyncError(e, stack);
    }
  }
}
