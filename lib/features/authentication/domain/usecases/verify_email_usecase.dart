import 'package:dartz/dartz.dart';
import 'package:edutime/core/usecases/usecase.dart';
import 'package:edutime/features/authentication/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';

class VerifyEmailUseCase implements UseCaseWithParams<Unit, VerifyEmailParams>{
  final AuthRepository repository;

  VerifyEmailUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(VerifyEmailParams params) async {
    return await repository.verifyEmail(params.verificationCode);
  }
}

class VerifyEmailParams extends Equatable {
  final String verificationCode;

  const VerifyEmailParams({required this.verificationCode});

  @override
  List<Object?> get props => [verificationCode];
}