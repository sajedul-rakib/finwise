import 'package:finwise/core/errors/failure.dart';
import 'package:finwise/core/usecases/usecase.dart';
import 'package:finwise/features/password/domain/repositories/password_repository.dart';
import 'package:fpdart/fpdart.dart';

class ValidatePinUsecase implements Usecase<bool, String> {
  final PasswordRepository _passwordRepository;

  ValidatePinUsecase(PasswordRepository passwordRepository)
    : _passwordRepository = passwordRepository;

  @override
  Future<Either<bool, Failure>> call(params) {
    return _passwordRepository.validatePin(params);
  }
}
