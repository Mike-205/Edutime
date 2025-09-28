import 'package:edutime/features/authentication/data/models/user_model.dart';
import 'package:edutime/features/authentication/domain/entities/auth_result_entity.dart';

class AuthResultModel extends AuthResultEntity {
  const AuthResultModel({
    required super.user,
    required super.accessToken,
    required super.refreshToken,
    required super.accessTokenExpiry,
    required super.refreshTokenExpiry
  });

  factory AuthResultModel.fromJson(Map<String, dynamic> json) {
    return AuthResultModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      accessTokenExpiry: DateTime.parse(json['access_token_expiry']),
      refreshTokenExpiry: DateTime.parse(json['refresh_token_expiry']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': (user as UserModel).toJson(),
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'accessTokenExpiry': accessTokenExpiry.toIso8601String(),
      'refreshTokenExpiry': refreshTokenExpiry.toIso8601String(),
    };
  }
}