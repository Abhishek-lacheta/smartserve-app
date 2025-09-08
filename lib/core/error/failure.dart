import 'package:equatable/equatable.dart';

/// Represents a generic failure in the application.
abstract class Failure extends Equatable {
  final String message;

