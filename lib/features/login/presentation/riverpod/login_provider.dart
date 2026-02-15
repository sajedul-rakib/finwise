import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finwise/features/splash/data/datasource/local/auth_local_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import your layers
import '../../../splash/presentation/riverpod/auth_provider.dart';
import '../../data/datasource/remote/loing_remote_datasource.dart';
import '../../data/repository/login_repository_impl.dart';
import '../../domain/repository/login_repository.dart';
import '../../domain/usecase/login_use_case.dart';
import 'login_controller.dart';

// 1. Remote Data Source Provider
final loginRemoteDataSourceProvider = Provider<LoginRemoteDataSource>((ref) {
  return LoginRemoteDataSource(
    auth: FirebaseAuth.instance,
    store: FirebaseFirestore.instance,
  );
});

// 2. Local Data Source Provider
// (Ensure authBoxProvider is defined in your core providers or main.dart)
final loginLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final authBox = ref.watch(authBoxProvider);
  return AuthLocalDataSourceImpl(authBox);
});

// 3. Repository Provider (Matches your abstract LoginRepository)
final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final remoteDS = ref.watch(loginRemoteDataSourceProvider);
  final localDS = ref.watch(loginLocalDataSourceProvider);

  return LoginRepositoryImpl(remoteDS, localDS);
});

// 4. Use Case Provider
final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(loginRepositoryProvider);
  return LoginUseCase(repo: repository);
});

// 5. Controller Provider (The one your UI listens to)
final loginControllerProvider =
    StateNotifierProvider<LoginController, AsyncValue<void>>((ref) {
      final useCase = ref.watch(loginUseCaseProvider);
      return LoginController(useCase, ref);
    });
