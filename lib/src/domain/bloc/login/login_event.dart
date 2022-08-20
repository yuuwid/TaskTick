part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

class LoginEventNpmChanged extends LoginEvent {
  final String npm;

  const LoginEventNpmChanged(this.npm);
}

class LoginEventPasswordChanged extends LoginEvent {
  final String password;

  const LoginEventPasswordChanged(this.password);
}

class LoginEventSubmited extends LoginEvent {
  const LoginEventSubmited();
}

class SkipLoginEventSubmited extends LoginEvent {
  const SkipLoginEventSubmited();
}
