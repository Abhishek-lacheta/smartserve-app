import 'package:firebase_auth/firebase_auth.dart';
import '../datasources/firebase_auth_datasource.dart';
import '../datasources/firestore_datasource.dart';
import '../models/user_model.dart';

/// Provides core implementation and business logic properties.
class AuthRepository {
  final FirebaseAuthDataSource _authDataSource;
  final FirestoreDataSource _firestoreDataSource;

  AuthRepository({
    FirebaseAuthDataSource? authDataSource,
    FirestoreDataSource? firestoreDataSource,
