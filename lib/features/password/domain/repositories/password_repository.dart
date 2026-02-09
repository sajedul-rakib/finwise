import 'package:finwise/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class PasswordRepository {
  Future<Either<bool, Failure>> validatePin(String pin);
  Future<Either<bool, Failure>> setPin(String pin);
  Future<Either<bool, Failure>> clearPin();
}
