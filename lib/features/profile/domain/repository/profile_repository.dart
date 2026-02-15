import 'dart:io';

import 'package:finwise/features/profile/domain/entities/user_entity.dart';

abstract class ProfileRepository {
  Future<UserEntity> getLoggedUserProfileData({required String userId});
  Future<UserEntity> updateUserData({
    required String userId,
    required UserEntity entity,
  });
  Future<void> uploadAvatar({required String userId, required File imageFile});
}
