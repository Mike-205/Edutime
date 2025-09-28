import 'package:dartz/dartz.dart';
import 'package:edutime/core/usecases/usecase.dart';
import 'package:edutime/features/authentication/domain/repository/auth_repository.dart';

import '../../../../core/errors/failures.dart';

class SignOutUseCase implements UseCaseWithoutParams<Unit> {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await repository.signOut();
  }
}