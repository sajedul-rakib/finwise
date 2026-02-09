import 'package:finwise/core/errors/failure.dart';
import 'package:finwise/features/password/domain/repositories/password_repository.dart';
import 'package:fpdart/fpdart.dart';

import '../datasource/local/local_pin_datasource.dart';

class PasswordRepositoryImpl implements PasswordRepository {
  final LocalPinDatasource _localPinDatasource;

  PasswordRepositoryImpl(LocalPinDatasourceImpl localPinDatasource)
    : _localPinDatasource = localPinDatasource;

  @override
  Future<Either<bool, Failure>> clearPin() async {
    try {
      final res = await _localPinDatasource.clearPin();
      return left(res);
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<bool, Failure>> setPin(String pin) async {
    try {
      final res = await _localPinDatasource.setPin(pin);
      return left(res);
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<bool, Failure>> validatePin(String pin) async {
    try {
      final res = await _localPinDatasource.validatePin(pin);
      return left(res);
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }
}
