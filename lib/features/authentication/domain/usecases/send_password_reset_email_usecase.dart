import 'package:dartz/dartz.dart';
import 'package:edutime/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../repository/auth_repository.dart';

class SendPasswordResetEmailUseCase implements UseCaseWithParams<Unit, SendPasswordResetEmailParams> {
  final AuthRepository repository;

  SendPasswordResetEmailUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(SendPasswordResetEmailParams params) async {
    return await repository.sendPasswordResetEmail(params.email);
  }
}

class SendPasswordResetEmailParams extends Equatable {
  final String email;

  const SendPasswordResetEmailParams({required this.email});

  @override
  List<Object?> get props => [email];
}