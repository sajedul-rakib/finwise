import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../entities/auth_state.dart';
import '../repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository repo;
  final Box settingsBox;
  AuthUseCase({required this.repo, required this.settingsBox});

  Future<AuthState> checkStatus() async {
    // 1. Check for PIN
    if (settingsBox.get('hasPin', defaultValue: false)) {
      return AuthState.pinRequired;
    }

    // 2. Check if first open
    if (settingsBox.get('isFirstOpen', defaultValue: true)) {
      return AuthState.onboarding;
    }

    // 3. Check Firebase via Repository
    final res = await repo.checkUserIsLoggedIn();
    return res;
  }
}
