import 'package:dio/dio.dart';
import 'package:edutime/features/authentication/domain/repository/auth_repository.dart';

import '../utils/services/secure_storage.dart';

class AuthInterceptor extends Interceptor {
  final AuthRepository? authRepository;
  final SecureStorage secureStorage;

  AuthInterceptor({this.authRepository, required this.secureStorage});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await secureStorage.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 && authRepository != null) {
      try {
        final refreshToken = await secureStorage.getRefreshToken();
        if (refreshToken != null && refreshToken.isNotEmpty) {
          final refreshResult = await authRepository!.refreshToken(refreshToken);

          await refreshResult.fold(
            (failure) async => handler.next(err),
            (authResult) async {
              await secureStorage.storeTokenData(
                accessToken: authResult.accessToken,
                refreshToken: authResult.refreshToken,
                accessTokenExpiry: authResult.accessTokenExpiry,
                refreshTokenExpiry: authResult.refreshTokenExpiry
              );

              // Retry the original request
              final clonedRequest = err.requestOptions.copyWith();
              clonedRequest.headers['Authorization'] = 'Bearer ${authResult.accessToken}';

              final response = await Dio().fetch(clonedRequest);
              handler.resolve(response);
            }
          );
        } else {
          await secureStorage.clearAuthData();
          handler.next(err);
        }
      } catch (e) {
        await secureStorage.clearAuthData();
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }
}