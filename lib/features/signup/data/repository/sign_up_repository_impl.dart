import 'package:finwise/features/signup/data/datasource/remote/sign_up_remote_datasource.dart';
import 'package:finwise/features/splash/domain/repository/auth_repository.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/sign_up_repository.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDatasource _signUpRemoteDatasource;
  final AuthRepository _authRepository;

  SignUpRepositoryImpl({
    required SignUpRemoteDatasource signUpRemoteDataSource,
    required AuthRepository authRepository,
  }) : _signUpRemoteDatasource = signUpRemoteDataSource,
       _authRepository = authRepository;

  @override
  Future<UserEntity> signUpWithEmailAndPassword({
    required String password,
    required UserEntity user,
  }) async {
    final credential = await _signUpRemoteDatasource.signUpWithEmailAndPassword(
      password: password,
      user: user,
    );

    final res = await _authRepository.getCurrentUserProfile(
      credential.user!.uid,
    );
    return res;
  }
}
