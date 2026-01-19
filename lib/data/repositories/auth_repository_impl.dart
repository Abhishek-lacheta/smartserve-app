import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../datasources/firebase_auth_datasource.dart';
import '../datasources/firestore_datasource.dart';
import '../models/user_model.dart';

@LazySingleton(as: IAuthRepository)
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class AuthRepositoryImpl implements IAuthRepository {
  final FirebaseAuthDataSource _authDataSource;
  final FirestoreDataSource _firestoreDataSource;

  AuthRepositoryImpl(
    this._authDataSource,
    this._firestoreDataSource,
  );

  @override
  Stream<UserEntity?> get authStateChanges => _authDataSource.authStateChanges.map((user) {
        if (user == null) return null;
        return UserEntity(
          uid: user.uid,
          name: user.displayName ?? 'Unknown',
          email: user.email ?? 'No email',
          profileImage: user.photoURL,
        );
      });

  @override
  UserEntity? get currentUser {
    final user = _authDataSource.currentUser;
    if (user == null) return null;
    return UserEntity(
      uid: user.uid,
      name: user.displayName ?? 'Unknown',
      email: user.email ?? 'No email',
      profileImage: user.photoURL,
    );





  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
