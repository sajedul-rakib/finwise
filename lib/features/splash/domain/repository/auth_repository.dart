import 'package:finwise/features/signup/domain/entities/user_entity.dart';
import 'package:finwise/features/splash/domain/entities/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<AuthState> checkUserIsLoggedIn();
  Future<User?> currentLoggedUser();
  Future<UserEntity> getCurrentUserProfile();
  Future<void> signOut();
}
