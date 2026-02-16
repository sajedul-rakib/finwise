import 'package:finwise/features/splash/domain/entities/auth_state.dart';

import '../entities/user_entity.dart';

abstract class LoginRepository {
  Future<AuthState> login({required String email, required String password});
  Future<UserEntity> getLoggedUserProfileData({required String userId});
}
