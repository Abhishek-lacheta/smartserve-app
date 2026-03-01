import 'package:fpdart/fpdart.dart';
import '../../core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class IAuthRepository {
  Stream<UserEntity?> get authStateChanges;
  UserEntity? get currentUser;
  
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();






}
