import 'package:equatable/equatable.dart';

/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String? profileImage;

  const UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    this.profileImage,
  });

  @override
  List<Object?> get props => [uid, name, email, profileImage];





