
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth ;

  AuthRemoteDataSource(this._firebaseAuth);

  // ================= REGISTER =================

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final credential =
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );

    await credential.user?.updateDisplayName(name.trim());
  }

  // ================= LOGIN =================

  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  // ================= LOGOUT =================

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  // ================= AUTH STATE =================

  Stream<bool> get authStateChanges {
    return _firebaseAuth
        .authStateChanges()
        .map((user) => user != null);
  }

  // ================= CURRENT USER =================

  bool get isAuthenticated {
    return _firebaseAuth.currentUser != null;
  }
}
