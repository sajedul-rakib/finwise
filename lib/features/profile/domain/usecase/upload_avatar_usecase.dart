import 'dart:io';

import '../repository/profile_repository.dart';

class UploadAvatarUseCase {
  final ProfileRepository repository;
  UploadAvatarUseCase(this.repository);

  Future<void> execute(String userId, File file) async {
    return await repository.uploadAvatar(userId: userId, imageFile: file);
  }
}
