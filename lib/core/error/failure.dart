import 'package:equatable/equatable.dart';

/// Represents a generic failure in the application.
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];






}

/// Represents a failure originating from server/network issues.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

/// Represents a failure related to authentication.
class AuthFailure extends Failure {
  const AuthFailure(String message) : super(message);
}

/// Represents an unknown or unexpected failure.
class UnknownFailure extends Failure {
  const UnknownFailure(String message) : super(message);
