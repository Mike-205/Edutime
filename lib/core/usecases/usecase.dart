import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

abstract class UseCaseWithParams<Type, Params> extends UseCase<Type, Params> {}

abstract class UseCaseWithoutParams<Type> extends UseCase<Type, NoParams> {}