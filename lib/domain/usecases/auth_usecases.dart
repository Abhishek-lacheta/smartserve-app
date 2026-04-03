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

  SignInWithGoogleUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.signInWithGoogle();






  }
}

@injectable
class SignOutUseCase implements UseCase<void, NoParams> {
  final IAuthRepository repository;

  SignOutUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.signOut();
  }
}

@injectable
class GetCurrentUserUseCase {
  final IAuthRepository repository;

  GetCurrentUserUseCase(this.repository);
