import 'package:dartz/dartz.dart';
import 'package:edutime/core/errors/failures.dart';
import 'package:edutime/core/usecases/usecase.dart';

import '../repository/auth_repository.dart';

class SendEmailVerificationUseCase implements UseCaseWithoutParams<Unit> {
  final AuthRepository repository;

  SendEmailVerificationUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await repository.sendEmailVerification();
  }
}