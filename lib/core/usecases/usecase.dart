import 'package:fpdart/fpdart.dart';

import '../errors/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<SuccessType, Failure>> call(Params params);
}

class NoParams {
  const NoParams();
}
