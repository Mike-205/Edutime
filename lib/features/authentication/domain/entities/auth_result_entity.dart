import 'package:edutime/features/authentication/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class AuthResultEntity extends Equatable {
  final UserEntity user;
  final String accessToken;
  final String refreshToken;
  final DateTime accessTokenExpiry;
  final DateTime refreshTokenExpiry;

  const AuthResultEntity({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.accessTokenExpiry,
    required this.refreshTokenExpiry
  });

  @override
  List<Object?> get props => [user, accessToken, refreshToken, accessTokenExpiry, refreshTokenExpiry];

  bool get isAccessTokenValid => DateTime.now().isAfter(accessTokenExpiry);

  bool get isRefreshTokenValid => DateTime.now().isAfter(refreshTokenExpiry);
}