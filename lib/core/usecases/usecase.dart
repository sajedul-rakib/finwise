import 'package:fpdart/fpdart.dart';

import '../errors/failure.dart';

abstract interface class Usecase<SuccessType, T> {
  Future<Either<SuccessType, Failure>> call(T params);
}
