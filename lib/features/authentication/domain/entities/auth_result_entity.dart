import 'package:edutime/features/authentication/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class AuthResultEntity extends Equatable {
  final UserEntity user;
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  const AuthResultEntity({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  @override
  List<Object?> get props => [user, accessToken, refreshToken, expiresAt];

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}