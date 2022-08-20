import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tasktick/src/app/extension/bloc/bloc_interface.dart';
import 'package:tasktick/src/data/entities/user.dart';
import 'package:tasktick/src/domain/repositories/auth_repository.dart';
import 'package:tasktick/src/domain/repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with BlocEventHandler {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthStatus> _authenticationStatusSubscription;

  AuthBloc({
    required AuthRepository authRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _userRepository = userRepository,
        super(const AuthState.unknown()) {
    registerEventHandler();
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authRepository.dispose();
    return super.close();
  }

  @override
  registerEventHandler() {
    on<AuthEventStatusChange>(_onAuthEventStatusChange);
    on<AuthEventLogout>(_onAuthEventLogout, transformer: droppable());
    _authenticationStatusSubscription = _authRepository.status
        .listen((status) => add(AuthEventStatusChange(status)));
  }

  Future<void> _onAuthEventStatusChange(
    AuthEventStatusChange event,
    Emitter<AuthState> emit,
  ) async {
    switch (event.status) {
      case AuthStatus.unauthenticated:
        return emit(const AuthState.unauthenticated());
      case AuthStatus.authenticated:
        final user = await _tryGetUser();
        return emit(user != null
            ? AuthState.authenticated(user)
            : const AuthState.unauthenticated());
      case AuthStatus.unknown:
        return emit(const AuthState.unknown());
    }
  }

  Future<void> _onAuthEventLogout(
    AuthEventLogout event,
    Emitter<AuthState> emit,
  ) async {
    _authRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
