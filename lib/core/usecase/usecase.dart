import 'package:fpdart/fpdart.dart';
import 'package:words_learning/core/error/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract interface class StreamUseCase<SuccessType, Params> {
  Stream<Either<Failure, SuccessType>> call(Params params);
}

final class NoParams {}
