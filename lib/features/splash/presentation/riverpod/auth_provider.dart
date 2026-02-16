import 'package:finwise/features/splash/domain/usecase/sign_out_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../../data/datasource/local/auth_local_datasource.dart';
import '../../data/datasource/remote/auth_remote_datasource.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/usecase/auth_use_case.dart';

// 1. External SDK Providers
final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => throw UnimplementedError(),
);
final firestoreProvider = Provider<FirebaseFirestore>(
  (ref) => throw UnimplementedError(),
);
final firebaseStorageProvider = Provider<FirebaseStorage>(
  (ref) => throw UnimplementedError(),
);

// This provider is overridden in main.dart with the opened Hive box
final authBoxProvider = Provider<Box>((ref) => throw UnimplementedError());
final settingsBoxProvider = Provider<Box>((ref) => throw UnimplementedError());

// 2. Data Source Providers
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return FirebaseAuthRemoteDataSourceImpl(
    auth: ref.watch(firebaseAuthProvider),
    firestore: ref.watch(firestoreProvider),
  );
});

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  return AuthLocalDataSourceImpl(ref.watch(authBoxProvider));
});

// 3. Repository Provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
  );
});

// 4. Use Case Provider
final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  return SignOutUseCase(repo: ref.watch(authRepositoryProvider));
});
// The UI/Notifier will watch this provider
final checkAuthStatusUseCaseProvider = Provider<AuthUseCase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return AuthUseCase(repo: repo, settingsBox: ref.watch(settingsBoxProvider));
});
