import 'package:edutime/features/authentication/data/models/auth_result_model.dart';
import 'package:edutime/features/authentication/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResultModel> signInWithEmailAndPassword({
    required String emailOrRegNo,
    required String password,
  });

  Future<AuthResultModel> googleAuth({
    required String idToken,
    String accessToken,
    required String registrationNumber,
  });

  Future<AuthResultModel> signUpWithEmailAndPassword({
    required String email,
    required String fullName,
    required String password,
    required String registrationNumber,
  });

  Future<void> signOut(String refreshToken);

  Future<AuthResultModel> refreshToken(String refreshToken);

  Future<void> sendEmailVerification();

  Future<void> verifyEmail(String verificationCode);

  Future<void> sendPasswordResetEmail(String email);

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<UserModel?> getCurrentUser();

  Future<void> resetPassword({
    required String resetToken,
    required String email,
  });
}