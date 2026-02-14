//provide usecase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finwise/features/signup/domain/usecase/sign_up_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/sign_up_repository_impl.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/sign_up_repository.dart';

// 1. Repository Provider
final signUpRepositoryProvider = Provider<SignUpRepository>((ref) {
  return SignUpRepositoryImpl(
    firebaseAuth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
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
    state = await AsyncValue.guard(
      () => _signUpUseCase(password: password, userEntity: user),
    );
  }
}

final signUpControllerProvider =
    StateNotifierProvider<SignUpController, AsyncValue<UserEntity?>>((ref) {
      return SignUpController(ref.watch(signUpUseCaseProvider));
    });
