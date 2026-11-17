
import 'dart:async';
import 'package:agora_app/feature/auth/domain/repositories/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/login/login_request_model.dart';
import '../../data/models/register/register_request_model.dart';
import '../../domain/errors/auth_exception.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepository;

  StreamSubscription<bool>? _authSubscription;

  AuthCubit(this._authRepository) : super(const AuthState.initial()) {
    _listenToAuthChanges();
  }

  // ================= AUTH STATE LISTENER =================

  void _listenToAuthChanges() {
    _authSubscription = _authRepository.authStateChanges.listen(
          (isAuthenticated) {
        emit(
          isAuthenticated
              ? const AuthState.authenticated()
              : const AuthState.unauthenticated(),
        );
      },
    );
  }

  // ================= REGISTER =================

  Future<void> register(RegisterRequestModel request) async {
    emit(const AuthState.loading());

    try {
      await _authRepository.register(registerRequestModel: request);
      emit(const AuthState.authenticated());
    } on AuthException catch (e) {
      emit(AuthState.error(e.code));
    } catch (_) {
      emit(const AuthState.error('Something went wrong'));
    }
  }

  // ================= LOGIN =================

  Future<void> login(LoginRequestModel request) async {
    emit(const AuthState.loading());

    try {
      await _authRepository.login(loginRequestModel: request);
      emit(const AuthState.authenticated());
    } on AuthException catch (e) {
      emit(AuthState.error(e.code));
    } catch (_) {
      emit(const AuthState.error('Something went wrong'));
    }
  }

  // ================= LOGOUT =================

  Future<void> logout() async {
    emit(const AuthState.loading());

    try {
      await _authRepository.logout();
      emit(const AuthState.unauthenticated());
    } catch (_) {
      emit(const AuthState.error('Logout failed'));
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
