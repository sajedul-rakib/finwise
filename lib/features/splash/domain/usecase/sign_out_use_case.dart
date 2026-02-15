import 'package:finwise/features/splash/domain/entities/auth_state.dart';
import 'package:finwise/features/splash/domain/repository/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository _authRepository;
  SignOutUseCase({required AuthRepository repo}) : _authRepository = repo;

  Future<AuthState> call() async {
    _authRepository.signOut();
    return AuthState.unauthenticated;
  }
}
