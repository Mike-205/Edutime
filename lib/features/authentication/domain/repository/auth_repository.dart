import 'package:dartz/dartz.dart';
import 'package:edutime/features/authentication/domain/usecases/sign_in_usecase.dart';
import 'package:edutime/features/authentication/domain/usecases/sign_up_usecase.dart';

import '../../../../core/errors/failures.dart';
import '../entities/auth_parameters.dart';
import '../entities/auth_result_entity.dart';
import '../entities/user_entity.dart';

/// Repository responsible for handling all authentication-related operations.
/// 
/// Provides methods for user authentication, registration,
/// token management, email verification, password management, and user session control.
abstract class AuthRepository {
  /// Signs in a user using email/password or Google authentication.
  ///
  /// [params] contains the credentials needed for authentication.
  /// Returns an [AuthResultEntity] with user data and tokens on success,
  /// or a [Failure] if authentication fails.
  Future<Either<Failure, AuthResultEntity>> signIn(SignInParams params);

  /// Registers a new user in the system.
  ///
  /// [params] contains the user information and credentials.
  /// Returns an [AuthResultEntity] with the created user's data and tokens on success,
  /// or a [Failure] if registration fails.
  Future<Either<Failure, AuthResultEntity>> signUp(CreateUserParams params);


  Future<Either<Failure, AuthResultEntity>> googleAuth(GoogleAuthParams params);

  /// Refreshes an expired access token using a refresh token.
  ///
  /// [refreshToken] is the token used to obtain a new access token.
  /// Returns an [AuthResultEntity] with new tokens on success,
  /// or a [Failure] if token refresh fails.
  Future<Either<Failure, AuthResultEntity>> refreshToken(String refreshToken);

  /// Sends an email verification link to the current user's email address.
  ///
  /// Returns void on success or a [Failure] if sending fails.
  Future<Either<Failure, Unit>> sendEmailVerification();

  /// Verifies a user's email address using a verification code.
  ///
  /// [verificationCode] is the code sent to the user's email.
  /// Returns void on success or a [Failure] if verification fails.
  Future<Either<Failure, Unit>> verifyEmail(String verificationCode);

  /// Sends a password reset email to the specified email address.
  ///
  /// [email] is the address to send the password reset link to.
  /// Returns void on success or a [Failure] if sending fails.
  Future<Either<Failure, Unit>> sendPasswordResetEmail(String email);

  /// changes a user's password.
  ///
  /// [oldPassword] is the user's current password for verification.
  /// [newPassword] is the new password to set.
  /// Returns void on success or a [Failure] if reset fails.
  Future<Either<Failure, Unit>> changePassword({required String currentPassword, required String newPassword});

  /// Retrieves the currently authenticated user.
  ///
  /// Returns the current [UserEntity] if authenticated, null if no user is logged in,
  /// or a [Failure] if retrieval fails.
  Future<Either<Failure, UserEntity?>> getCurrentUser();

  /// Signs out the current user and clears authentication tokens.
  ///
  /// Returns void on success or a [Failure] if sign out fails.
  Future<Either<Failure, Unit>> signOut();

  /// Resets a user's password using a reset token.
  ///
  /// [email] is the user's email address.
  /// Returns void on success or a [Failure] if reset fails.
  Future<Either<Failure, Unit>> resetPassword({required String resetToken, required String email});
}