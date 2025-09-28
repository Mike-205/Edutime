import 'package:dartz/dartz.dart';
import 'package:edutime/core/usecases/usecase.dart';
import 'package:edutime/features/authentication/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';

class ResetPasswordUseCase implements UseCaseWithParams<Unit, ResetPasswordParams> {
  final AuthRepository repository;

  ResetPasswordUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(ResetPasswordParams params) async {
    return await repository.resetPassword(
      resetToken: params.resetToken,
      email: params.email
    );
  }
}

class ResetPasswordParams extends Equatable {
  final String email;
  final String resetToken;

  const ResetPasswordParams({required this.email, required this.resetToken});

  @override
  List<Object?> get props => [email, resetToken];
}