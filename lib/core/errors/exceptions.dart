abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException({
    required this.message,
    this.statusCode,
  });
}

class ServerException extends AppException {
  const ServerException({
    required super.message,
    super.statusCode,
  });
}

class NetworkException extends AppException {
  const NetworkException({
    super.message = 'No internet connection'
  });
}

class CacheException extends AppException {
  const CacheException({
    super.message = 'Cache error'
  });
}

class ValidationException extends AppException {
  const ValidationException({
    required super.message
  });
}

class PermissionException extends AppException {
  const PermissionException({
    required super.message
  });
}

class AuthenticationException extends AppException {
  const AuthenticationException({
    required super.message,
    super.statusCode,
  });
}

class SecureStorageException extends AppException {
  const SecureStorageException({
    required super.message
  });
}