import 'package:finwise/features/signup/domain/entities/user_entity.dart';
import 'package:finwise/features/signup/domain/repository/sign_up_repository.dart';

class SignUpUseCase {
  final SignUpRepository _signUpRepository;
  SignUpUseCase(this._signUpRepository);

  Future<UserEntity> call({
    required String password,
    required UserEntity userEntity,
  }) async {
    //1. Execute the repository file function
    final registerNewUser = await _signUpRepository.signUpWithEmailAndPassword(
      password: password,
      user: userEntity,
    );

    //return
    return registerNewUser;
  }
}
