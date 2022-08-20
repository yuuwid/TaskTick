part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventStatusChange extends AuthEvent {
  final AuthStatus status;

  const AuthEventStatusChange(this.status);
}

class AuthEventLogout extends AuthEvent {}
