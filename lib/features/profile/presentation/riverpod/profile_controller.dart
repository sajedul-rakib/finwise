import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecase/get_profile_use_case.dart';
import '../../domain/usecase/update_profile_usecase.dart';
import '../../domain/usecase/upload_avatar_usecase.dart';

class ProfileController extends StateNotifier<AsyncValue<UserEntity?>> {
  final GetProfileUseCase _getProfile;
  final UpdateProfileUseCase _updateProfile;
  final UploadAvatarUseCase _uploadAvatar;

  ProfileController({
    required GetProfileUseCase getProfile,
    required UpdateProfileUseCase updateProfile,
    required UploadAvatarUseCase uploadAvatar,
  }) : _getProfile = getProfile,
       _updateProfile = updateProfile,
       _uploadAvatar = uploadAvatar,
       super(const AsyncLoading());

  // Load profile data
  Future<void> loadProfile() async {
    state = const AsyncLoading();
    try {
      final user = await _getProfile.execute();
      state = AsyncData(user);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  // Update profile details
  Future<void> updateInfo(String userId, UserEntity user) async {
    state = const AsyncLoading();
    try {
      final updatedUser = await _updateProfile.execute(userId, user);
      state = AsyncData(updatedUser);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  // Upload Avatar
  Future<void> changeAvatar(File file) async {
    final currentUser = state.value;
    state = const AsyncLoading();
    try {
      await _uploadAvatar.execute(currentUser!.userId, file);
      await loadProfile();
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
