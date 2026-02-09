import 'package:finwise/core/errors/failure.dart';
import 'package:finwise/core/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/password_repository.dart';

class SetPinUsecase implements Usecase<bool, String> {
  final PasswordRepository _passwordRepository;

  SetPinUsecase(PasswordRepository passwordRepository)
    : _passwordRepository = passwordRepository;
  @override
  Future<Either<bool, Failure>> call(String pin) {
    return _passwordRepository.setPin(pin);
  }
}
