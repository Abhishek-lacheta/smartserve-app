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



    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      await _ensureGoogleSignInInitialized();
      
      // Trigger the authentication flow using the v7 API
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();

      if (googleUser == null) {
        return null; // The user canceled the sign-in
      }

      // Obtain the auth details from the request (no await needed in v7)
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final GoogleSignInClientAuthorization? clientAuth = await googleUser
          .authorizationClient
          .authorizationForScopes(['email', 'profile']);

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: clientAuth?.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      throw Exception('Failed to sign in with Google: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _ensureGoogleSignInInitialized();
      await GoogleSignIn.instance.signOut();
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('Failed to sign out: $e');
    }
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  User? get currentUser => _firebaseAuth.currentUser;
}
