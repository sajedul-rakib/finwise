import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/entities/auth_state.dart';
import '../../../signup/domain/entities/user_entity.dart';
import '../datasource/local/auth_local_datasource.dart';
import '../datasource/remote/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource;

  @override
  Future<AuthState> checkUserIsLoggedIn() async {
    // 1. Check if there is an active Firebase session
    final user = await _remoteDataSource.getCurrentFirebaseUser();
    if (user == null) {
      await _localDataSource.clearCache();
      return AuthState.unauthenticated;
    }
    await getCurrentUserProfile();
    return AuthState.authenticated;
  }

  @override
  Future<UserEntity> getCurrentUserProfile([String? userId]) async {
    final firebaseUser = await _remoteDataSource.getCurrentFirebaseUser();
    if (firebaseUser == null) throw Exception("The user is not logged in");

    // Try cache first for speed
    final cached = await _localDataSource.getLastUser();
    if (cached != null && cached.userId == firebaseUser.uid) {
      return cached;
    }

    // Fallback to remote
    final remote = await _remoteDataSource.getUserProfile(
      userId ?? firebaseUser.uid,
    );
    if (remote == null) throw Exception("User profile not found");
    await _localDataSource.cacheUser(remote);
    return remote;
  }

  @override
  Future<void> signOut() async {
    await _remoteDataSource.signOut();
    await _localDataSource.clearCache();
    final settingsBox = await Hive.openBox("settings");
    await settingsBox.delete('hasPin');
  }
}
