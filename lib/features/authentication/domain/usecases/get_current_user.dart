import 'package:dartz/dartz.dart';
import 'package:edutime/core/usecases/usecase.dart';
import 'package:edutime/features/authentication/domain/entities/user_entity.dart';
import 'package:edutime/features/authentication/domain/repository/auth_repository.dart';

import '../../../../core/errors/failures.dart';

class GetCurrentUserUseCase implements UseCaseWithoutParams<UserEntity?> {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) async {
    return await repository.getCurrentUser();
  }
}