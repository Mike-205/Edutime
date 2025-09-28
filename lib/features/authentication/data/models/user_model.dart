import 'dart:convert';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.fullName,
    required super.role,
    required super.registrationNumber,
    required super.cohortId,
    super.profilePictureUrl,
    required super.isEmailVerified,
    required super.isActive,
    required super.createdAt,
    super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      fullName: json['full_name'],
      role: UserRole.fromString(json['role']),
      registrationNumber: json['registration_number'],
      cohortId: json['cohort_id'],
      profilePictureUrl: json['profile_picture_url'],
      isEmailVerified: json['is_email_verified'],
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'role': role.value,
      'registration_number': registrationNumber,
      'cohort_id': cohortId,
      'profile_picture_url': profilePictureUrl,
      'is_email_verified': isEmailVerified,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  String toJsonString() => json.encode(toJson());

  factory UserModel.fromJsonString(String jsonString) => UserModel.fromJson(json.decode(jsonString));

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      fullName: entity.fullName,
      role: entity.role,
      registrationNumber: entity.registrationNumber,
      cohortId: entity.cohortId,
      profilePictureUrl: entity.profilePictureUrl,
      isEmailVerified: entity.isEmailVerified,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}