/// These firebase service extensions do not import any other firebase services

import 'package:firebase_auth/firebase_auth.dart';

extension LoginFirebaseAuthX on FirebaseAuth {
  /// Sign in with Apple.
  ///
  /// This handles the displaying of the Sign in with Apple dialog and
  /// finalizing with Firebase Auth.
  Future<User> signInWithApple() async {
    throw UnimplementedError('use sign_in_with_apple package');
  }

  /// Sign in with Google.
  ///
  /// This handles the displaying of the Google SignIn dialog and
  /// finalizing with Firebase Auth.
  Future<User> signInWithGoogle() async {
    throw UnimplementedError('use google_sign_in package');
  }
}
