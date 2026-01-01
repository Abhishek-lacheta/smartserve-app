import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/failure.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/i_auth_repository.dart';

@injectable
/// Executes the business logic bridging the domain and data layers.
/// Executes the business logic bridging the domain and data layers.
/// Executes the business logic bridging the domain and data layers.
/// Executes the business logic bridging the domain and data layers.
/// Executes the business logic bridging the domain and data layers.
class SignInWithGoogleUseCase implements UseCase<UserEntity, NoParams> {
  final IAuthRepository repository;

