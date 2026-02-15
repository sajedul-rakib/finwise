import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finwise/features/profile/domain/usecase/get_profile_use_case.dart';
import 'package:finwise/features/profile/domain/usecase/update_profile_usecase.dart';
import 'package:finwise/features/profile/domain/usecase/upload_avatar_usecase.dart';
import 'package:finwise/features/profile/presentation/riverpod/profile_controller.dart';
import 'package:finwise/features/splash/presentation/riverpod/auth_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../signup/domain/entities/user_entity.dart';
import '../../data/datasource/local/profile_local_datasource.dart';
import '../../data/datasource/remote/profile_remote_datasource.dart';
import '../../data/repositories/profile_repository_impl.dart';
import '../../domain/repository/profile_repository.dart';

final profileRemoteDSProvider = Provider(
  (ref) => ProfileRemoteDataSource(
    firestore: FirebaseFirestore.instance,
    storage: FirebaseStorage.instance,
  ),
);

final profileLocalDSProvider = Provider(
  (ref) => ProfileLocalDataSource(authBox: ref.watch(authBoxProvider)),
); // authBox opened in main

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepositoryImpl(
    remoteDS: ref.watch(profileRemoteDSProvider),
    localDS: ref.watch(profileLocalDSProvider),
  ),
);

final getProfileUseCaseProvider = Provider((ref) {
  return GetProfileUseCase(ref.watch(profileRepositoryProvider));
});
final updateProfileUseCaseProvider = Provider((ref) {
  return UpdateProfileUseCase(ref.watch(profileRepositoryProvider));
});

final uploadAvatarUseCaseProvider = Provider((ref) {
  return UploadAvatarUseCase(ref.watch(profileRepositoryProvider));
});

final profileControllerProvider =
    StateNotifierProvider<ProfileController, AsyncValue<UserEntity?>>((ref) {
      return ProfileController(
        getProfile: ref.watch(getProfileUseCaseProvider),
        updateProfile: ref.watch(updateProfileUseCaseProvider),
        uploadAvatar: ref.watch(uploadAvatarUseCaseProvider),
      );
    });
