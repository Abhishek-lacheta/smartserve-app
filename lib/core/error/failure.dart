import 'package:equatable/equatable.dart';

/// Represents a generic failure in the application.
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];



