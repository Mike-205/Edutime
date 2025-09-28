import 'package:edutime/core/errors/exceptions.dart';
import 'package:edutime/core/network/api_client.dart';
import 'package:edutime/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:edutime/features/authentication/data/models/auth_result_model.dart';
import 'package:edutime/features/authentication/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword
  }) async {
    try {
      final response = await apiClient.post(
        '/auth/change-password',
        data: {
          'current_password': currentPassword,
          'new_password': newPassword,
        }
      );
      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data['message'] ?? 'Password change failed',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await apiClient.get('/auth/me');
      if (response.statusCode == 200 && response.data != null) {
        return UserModel.fromJson(response.data);
      } else if (response.statusCode == 401) {
        return null;
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Failed to fetch user',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is AppException) rethrow;
      if (e.toString().contains('401')) return null;
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<AuthResultModel> refreshToken(String refreshToken) async {
    try {
      final response = await apiClient.post('/auth/refresh', data: {'refresh_token': refreshToken});
      if (response.statusCode == 200 && response.data != null) {
        return AuthResultModel.fromJson(response.data['data']);
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Token refresh failed',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> resetPassword({required String resetToken, required String email}) async {
    try {
      final response = await apiClient.post('/auth/reset-password', data: {'reset_token': resetToken, 'email': email});
      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data['message'] ?? 'Password reset failed',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    try {
      final response = await apiClient.post('/auth/send-verification');

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data['message'] ?? 'Failed to send verification email',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      final response = await apiClient.post('/auth/forgot-password', data: {'email': email});
      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data['message'] ?? 'Failed to send password reset email',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<AuthResultModel> signInWithEmailAndPassword({
    required String emailOrRegNo,
    required String password
  }) async {
    try {
      final response = await apiClient.post('/auth/signin', data: {
        'email_regno': emailOrRegNo,
        'password': password,
      });
      if (response.statusCode == 200 && response.data != null) {
        return AuthResultModel.fromJson(response.data['data']);
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Sign in failed',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<AuthResultModel> googleAuth({
    required String idToken,
    String? accessToken,
    required String registrationNumber
  }) async {
    try {
      final response = await apiClient.post('/auth/google/signin', data: {
        'id_token': idToken,
        'access_token': accessToken,
        'registration_number': registrationNumber
      });
      if (response.statusCode == 200 && response.data != null) {
        return AuthResultModel.fromJson(response.data['data']);
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Sign in failed',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> signOut(String refreshToken) async {
    try {
      final response = await apiClient.post('/auth/signout', data: {'refresh_token': refreshToken});
      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data['message'] ?? 'Sign out failed',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<AuthResultModel> signUpWithEmailAndPassword({
    required String email,
    required String fullName,
    required String password,
    required String registrationNumber
  }) async {
    try {
      final response = await apiClient.post('/auth/signup', data: {
        'email': email,
        'full_name': fullName,
        'password': password,
        'registration_number': registrationNumber,
      });
      if (response.statusCode == 200 && response.data != null) {
        return AuthResultModel.fromJson(response.data['data']);
      } else {
        throw ServerException(
          message: response.data['message'] ?? 'Sign up failed',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> verifyEmail(String verificationCode) async {
    try {
      final response = await apiClient.post('/auth/verify-email', data: {'verification_code': verificationCode});
      if (response.statusCode != 200) {
        throw ServerException(
          message: response.data['message'] ?? 'Email verification failed',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is AppException) rethrow;
      throw ServerException(message: e.toString());
    }
  }
}