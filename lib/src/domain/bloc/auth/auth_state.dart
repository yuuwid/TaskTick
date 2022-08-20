// ignore_for_file: unused_element

part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  final AuthStatus status;
  final User user;

  const AuthState._({
    this.status = AuthStatus.unknown,
    this.user = const User(id: "-"),
  });

  const AuthState.unknown() : this._();

  const AuthState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];
}

// class AuthInitial extends AuthState {
//   AuthInitial() : super();
// }

// class AuthLoginState extends AuthState {
//   AuthLoginState(User user)
//       : super(
//           status: AuthStatus.authenticated,
//           user: user,
//         );
// }

// class AuthNotLoggedState extends AuthState {
//   AuthNotLoggedState()
//       : super(
//           status: AuthStatus.unauthenticated,
//         );
// }

// class AuthLogOutState extends AuthState {}
