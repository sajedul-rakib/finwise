import 'package:finwise/features/login/domain/repository/login_repository.dart';
import 'package:finwise/features/signup/domain/entities/user_entity.dart';
import 'package:finwise/features/splash/data/datasource/local/auth_local_datasource.dart';

import '../../../signup/data/model/User.dart';
import '../datasource/remote/loing_remote_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDS;
  final AuthLocalDataSource localDS;

  LoginRepositoryImpl(this.remoteDS, this.localDS);

  @override
  Future<void> login({required String email, required String password}) async {
    final credential = await remoteDS.login(email, password);
    if (credential.user != null) {
      // Fetch profile and cache it immediately
      final profile = await getLoggedUserProfileData(
        userId: credential.user!.uid,
      );
      await localDS.cacheUser(profile as UserModel);
    }
  }

  @override
  Future<UserEntity> getLoggedUserProfileData({required String userId}) async {
    final data = await remoteDS.fetchUserData(userId);
    if (data == null) throw Exception("User profile not found");
    return UserModel.fromMap(data);
  }
}
