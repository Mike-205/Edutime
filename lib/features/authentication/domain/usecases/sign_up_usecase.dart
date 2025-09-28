import 'package:dartz/dartz.dart';
import 'package:edutime/features/authentication/domain/entities/auth_result_entity.dart';
import 'package:edutime/features/authentication/domain/usecases/sign_in_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/auth_parameters.dart';
import '../entities/user_entity.dart';
import '../repository/auth_repository.dart';

class SignUpUseCase implements UseCaseWithParams<AuthResultEntity, CreateUserParams> {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  @override
  Future<Either<Failure, AuthResultEntity>> call(CreateUserParams params) async {
    return await repository.signUp(params);
  }
}