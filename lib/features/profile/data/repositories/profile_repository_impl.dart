import 'dart:io';
import '../../../signup/data/model/user_model.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasource/local/profile_local_datasource.dart';
import '../datasource/remote/profile_remote_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDS;
  final ProfileLocalDataSource localDS;

  ProfileRepositoryImpl({required this.remoteDS, required this.localDS});

  @override
  Future<UserEntity> getLoggedUserProfileData({required String userId}) async {
    // 1. Try to get from Cache for instant UI feedback
    final cached = await localDS.getProfileData();
    if (cached != null) {
      return cached;
    }

    // 2. Fetch from Remote
    final remoteData = await remoteDS.getUser(userId);
    final userModel = UserModel.fromMap(remoteData);

    // 3. Update Cache
    await localDS.cacheUserProfile(userModel);

    return userModel;
  }

  @override
  Future<UserEntity> updateUserData({
    required String userId,
    required UserEntity entity,
  }) async {
    final userModel = entity as UserModel;

    // 1. Update Remote
    await remoteDS.updateUser(userId, userModel.toMap());

    // 2. Update Local Cache
    await localDS.cacheUserProfile(userModel);

    return userModel;
  }

  @override
  Future<void> uploadAvatar({
    required String userId,
    required File imageFile,
  }) async {
    // 1. Upload to Storage
    final url = await remoteDS.uploadAvatar(userId, imageFile);

    // 2. Update Firestore with new URL
    await remoteDS.updateUser(userId, {'avatar': url});

    // 3. Update Local Cache
    final cached = await localDS.getProfileData();
    if (cached != null) {
      await localDS.cacheUserProfile(cached.copyWith(avatar: url));
    }
  }
}
