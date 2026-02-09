import 'package:finwise/core/errors/failure.dart';
import 'package:finwise/core/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/password_repository.dart';

class ClearPinUsecase implements Usecase<bool, Null> {
  final PasswordRepository _passwordRepository;

  ClearPinUsecase(PasswordRepository passwordRepository)
    : _passwordRepository = passwordRepository;
  @override
  Future<Either<bool, Failure>> call(p) {
    return _passwordRepository.clearPin();
  }
}
