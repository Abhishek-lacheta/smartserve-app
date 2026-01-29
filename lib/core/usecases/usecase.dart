import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'failure.dart';

/// Base interface for UseCases in the application.
/// [Type] is the return type of the UseCase.
/// [Params] are the parameters required to execute the UseCase.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);







}

/// A class representing no parameters for UseCases that don't need any.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
