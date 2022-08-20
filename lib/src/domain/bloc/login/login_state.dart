part of 'login_bloc.dart';

enum StatusLogin {
  waiting,
  connectApi,
  connectLocal,
  done,
  failed,
}

@immutable
class LoginState {
  final FormzStatus status;
  final StatusLogin msg;
  final Npm npm;
  final Password password;

  const LoginState({
    this.status = FormzStatus.pure,
    this.msg = StatusLogin.waiting,
    this.npm = const Npm.pure(),
    this.password = const Password.pure(),
  });

  LoginState copyWith({
    FormzStatus? status,
    StatusLogin? msg,
    Npm? npm,
    Password? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      npm: npm ?? this.npm,
      password: password ?? this.password,
    );
  }
}
