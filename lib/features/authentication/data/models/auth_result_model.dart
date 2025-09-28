import 'package:edutime/features/authentication/data/models/user_model.dart';
import 'package:edutime/features/authentication/domain/entities/auth_result_entity.dart';

class AuthResultModel extends AuthResultEntity {
  const AuthResultModel({
    required super.user,
    required super.accessToken,
    required super.refreshToken,
    required super.expiresAt,
  });

  factory AuthResultModel.fromJson(Map<String, dynamic> json) {
    return AuthResultModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      expiresAt: DateTime.parse(json['expires_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': (user as UserModel).toJson(),
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'expiresAt': expiresAt.toIso8601String(),
    };
  }
}