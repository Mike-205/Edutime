import 'package:equatable/equatable.dart';

enum UserRole {
  student('student'),
  classRep('class_rep'),
  admin('admin'),
  lecturer('lecturer'),
  facultyRep('faculty_rep');

  const UserRole(this.value);
  final String value;

  static UserRole fromString(String value) {
    return UserRole.values.firstWhere((role) => role.value == value);
  }
}

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String fullName;
  final UserRole role;
  final String registrationNumber;
  final String cohortId;
  final String? profilePictureUrl;
  final bool isEmailVerified;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    required this.registrationNumber,
    required this.cohortId,
    this.profilePictureUrl,
    required this.isEmailVerified,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id, email, fullName, registrationNumber,
    role, cohortId, profilePictureUrl,
    isEmailVerified, isActive, createdAt,
    updatedAt,
  ];

  UserEntity copyWith({
    final String? id,
    final String? email,
    final String? fullName,
    final UserRole? role,
    final String? registrationNumber,
    final String? cohortId,
    final String? profilePictureUrl,
    final bool? isEmailVerified,
    final bool? isActive,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      role: role ?? this.role,
      registrationNumber: registrationNumber ?? this.registrationNumber,
      cohortId: cohortId ?? this.cohortId,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}