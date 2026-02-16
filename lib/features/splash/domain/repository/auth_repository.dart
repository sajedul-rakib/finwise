import 'package:finwise/features/signup/domain/entities/user_entity.dart';
import 'package:finwise/features/splash/domain/entities/auth_state.dart';

abstract class AuthRepository {
  Future<AuthState> checkUserIsLoggedIn();
  Future<UserEntity> getCurrentUserProfile([String? userId]);
  Future<void> signOut();
}
