import '../entities/user_entity.dart';

abstract class LoginRepository {
  Future<void> login({required String email, required String password});
  Future<UserEntity> getLoggedUserProfileData({required String userId});
}
