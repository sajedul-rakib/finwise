import 'package:finwise/features/login/domain/repository/login_repository.dart';
import 'package:finwise/features/signup/domain/entities/user_entity.dart';
import 'package:finwise/features/splash/domain/repository/auth_repository.dart';

import '../../../signup/data/model/user_model.dart';
import '../../../splash/domain/entities/auth_state.dart';
import '../datasource/remote/loing_remote_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _remoteDS;

  final AuthRepository _authRepository;

  LoginRepositoryImpl({
    required LoginRemoteDataSource loginRemoteDataSource,
    required AuthRepository authRepository,
  }) : _remoteDS = loginRemoteDataSource,
       _authRepository = authRepository;

  @override
  Future<AuthState> login({
    required String email,
    required String password,
  }) async {
    final credential = await _remoteDS.login(email, password);
    if (credential.user != null) {
      await _authRepository.getCurrentUserProfile(credential.user!.uid);
      return AuthState.authenticated;
    } else {
      return AuthState.unauthenticated;
    }
  }

  @override
  Future<UserEntity> getLoggedUserProfileData({required String userId}) async {
    final data = await _remoteDS.fetchUserData(userId);
    if (data == null) throw Exception("User profile not found");
    return UserModel.fromMap(data);
  }
}
