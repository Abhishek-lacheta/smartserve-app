import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
/// Provides core implementation and business logic properties.
class FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth;
  bool _isGoogleSignInInitialized = false;

  FirebaseAuthDataSource({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      // For google_sign_in version 7+, we must explicitly initialize and pass the serverClientId
      // The serverClientId is the client_type: 3 ID found in android/app/google-services.json
      await GoogleSignIn.instance.initialize(
        serverClientId: '395109495964-9qgri340altsfegqvs8k2iipsiicvoi6.apps.googleusercontent.com',
      );
      _isGoogleSignInInitialized = true;

