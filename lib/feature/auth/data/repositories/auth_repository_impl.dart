
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/errors/auth_exception.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/remote/auth_remote_data_source.dart';
import '../models/login/login_request_model.dart';
import '../models/register/register_request_model.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepoImpl(this._remoteDataSource);

  @override
  Future<void> register({
    required RegisterRequestModel registerRequestModel
  }) async {
    try {
      await _remoteDataSource.register(
        name: registerRequestModel.name,
        email: registerRequestModel.email,
        password: registerRequestModel.password,
      ) ;
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  @override
  Future<void> login({
    required LoginRequestModel loginRequestModel
  }) async {
    try {
      await _remoteDataSource.login(
        email: loginRequestModel.email,
        password: loginRequestModel.password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _remoteDataSource.logout();
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code);
    }
  }

  @override
  Stream<bool> get authStateChanges {
    return _remoteDataSource.authStateChanges;
  }

  @override
  bool get isAuthenticated {
    return _remoteDataSource.isAuthenticated;
  }
}
