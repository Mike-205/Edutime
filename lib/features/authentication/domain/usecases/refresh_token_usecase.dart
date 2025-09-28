import 'package:dartz/dartz.dart';
import 'package:edutime/core/usecases/usecase.dart';
import 'package:edutime/features/authentication/domain/entities/auth_result_entity.dart';
import 'package:edutime/features/authentication/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';

class RefreshTokenUseCase implements UseCaseWithParams<AuthResultEntity, RefreshTokenParams> {
  final AuthRepository repository;

  RefreshTokenUseCase(this.repository);

  @override
  Future<Either<Failure, AuthResultEntity>> call(RefreshTokenParams params) async {
    return await repository.refreshToken(params.refreshToken);
  }
}

class RefreshTokenParams extends Equatable {
  final String refreshToken;

  const RefreshTokenParams({required this.refreshToken});

  @override
  List<Object?> get props => [refreshToken];
}