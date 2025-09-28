import 'package:equatable/equatable.dart';

class SignInParams extends Equatable {
  final String emailOrRegNo;
  final String password;

  const SignInParams({
    required this.emailOrRegNo,
    required this.password,
  });

  @override
  List<Object?> get props => [emailOrRegNo, password];
}

class CreateUserParams extends Equatable {
  final String email;
  final String fullName;
  final String registrationNumber;
  final String? password;

  const CreateUserParams({
    required this.email,
    required this.fullName,
    required this.registrationNumber,
    this.password,
  });

  @override
  List<Object?> get props => [email, fullName, registrationNumber, password];
}

class GoogleAuthParams extends Equatable {
  final String idToken;
  final String? accessToken;
  final String registrationNumber; // For Sign up

  const GoogleAuthParams({
    required this.idToken,
    this.accessToken,
    required this.registrationNumber,
  });

  @override
  List<Object?> get props => [idToken, accessToken, registrationNumber];
}