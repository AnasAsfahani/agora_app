
import '../../data/models/login/login_request_model.dart';
import '../../data/models/register/register_request_model.dart';

abstract class AuthRepo {
  Future<void> register({
    required RegisterRequestModel registerRequestModel
  });

  Future<void> login({
    required LoginRequestModel loginRequestModel
  });

  Future<void> logout();

  Stream<bool> get authStateChanges;

  bool get isAuthenticated;
}
