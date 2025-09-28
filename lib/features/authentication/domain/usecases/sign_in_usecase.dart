import 'package:dartz/dartz.dart';
import 'package:edutime/core/usecases/usecase.dart';
import 'package:edutime/features/authentication/domain/repository/auth_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/auth_parameters.dart';
import '../entities/auth_result_entity.dart';

class SignInUseCase implements UseCaseWithParams<AuthResultEntity, SignInParams> {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  @override
  Future<Either<Failure, AuthResultEntity>> call(SignInParams params) async {
    return await repository.signIn(params);
  }
}