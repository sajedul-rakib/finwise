import 'package:finwise/features/signup/data/datasource/remote/sign_up_remote_datasource.dart';
import 'package:finwise/features/signup/domain/usecase/sign_up_use_case.dart';
import 'package:finwise/features/splash/presentation/riverpod/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repository/sign_up_repository_impl.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/sign_up_repository.dart';

// 1. Repository Provider
final signUpRemoteDataSourceProvider = Provider((ref) {
  return SignUpRemoteDataSourceImpl(
    auth: ref.watch(firebaseAuthProvider),
    fireStore: ref.watch(firestoreProvider),
  );
});

final signUpRepositoryProvider = Provider<SignUpRepository>((ref) {
  return SignUpRepositoryImpl(
    signUpRemoteDataSource: ref.watch(signUpRemoteDataSourceProvider),
    authRepository: ref.watch(authRepositoryProvider),
  );
});

final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  final repositoryProvider = ref.watch(signUpRepositoryProvider);
  return SignUpUseCase(repositoryProvider);
});

class SignUpController extends StateNotifier<AsyncValue<UserEntity?>> {
  final SignUpUseCase _signUpUseCase;

  SignUpController(this._signUpUseCase) : super(const AsyncValue.data(null));

  Future<void> signUp({
    required String password,
    required UserEntity user,
  }) async {
    state = const AsyncLoading();
    try {
      final res = await _signUpUseCase(password: password, userEntity: user);
      state = AsyncData(res);
    } on FirebaseAuthException catch (e, st) {
      state = AsyncError(_handleAuthException(e), st);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace);
    }
  }

  String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'An account already exists for that email.';
      case 'invalid-email':
        return 'The email address is not valid.';
      default:
        return e.message ?? 'Authentication failed.';
    }
  }
}

final signUpControllerProvider =
    StateNotifierProvider<SignUpController, AsyncValue<UserEntity?>>((ref) {
      return SignUpController(ref.watch(signUpUseCaseProvider));
    });
