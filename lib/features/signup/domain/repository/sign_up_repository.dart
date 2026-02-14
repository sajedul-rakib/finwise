import 'package:finwise/features/signup/domain/entities/user_entity.dart';

abstract class SignUpRepository {
  Future<UserEntity> signUpWithEmailAndPassword({
    required String password,
    required UserEntity user,
  });
}
