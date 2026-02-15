import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/entities/auth_state.dart';
import '../../../signup/domain/entities/user_entity.dart';
import '../datasource/local/auth_local_datasource.dart';
import '../datasource/remote/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
    required FirebaseAuth firebaseAuth,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource,
       _firebaseAuth = firebaseAuth;

  @override
  Future<AuthState> checkUserIsLoggedIn() async {
    // 1. Check if there is an active Firebase session
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      await _localDataSource.clearCache();
      return AuthState.unauthenticated;
    }

    // 2. Check if we have the user profile cached locally
    final cachedUser = await _localDataSource.getLastUser();
    if (cachedUser != null) {
      return AuthState.authenticated;
    }

    // 3. If no cache, check remote Firestore to see if profile exists
    final remoteUser = await _remoteDataSource.getUserProfile(user.uid);
    if (remoteUser != null) {
      await _localDataSource.cacheUser(remoteUser);
      return AuthState.authenticated;
    }

    // 4. User is logged in but has no Firestore profile document
    return AuthState.unknown;
  }

  @override
  Future<User?> currentLoggedUser() async {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<UserEntity> getCurrentUserProfile() async {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser == null) throw Exception("No user logged in");

    // Try cache first for speed
    final cached = await _localDataSource.getLastUser();
    if (cached != null && cached.userId == firebaseUser.uid) {
      return cached;
    }

    // Fallback to remote
    final remote = await _remoteDataSource.getUserProfile(firebaseUser.uid);
    if (remote == null) throw Exception("User profile not found");

    await _localDataSource.cacheUser(remote);
    return remote;
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _localDataSource.clearCache();
      final settingsBox = await Hive.openBox("settings");
      final authBox = await Hive.openBox("auth_box");
      await authBox.delete("userId");
      await settingsBox.delete('hasPin');
    } catch (e) {
      throw Exception("Logout failed");
    }
  }
}
