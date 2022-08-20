import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:tasktick/src/app/extension/bloc/bloc_interface.dart';
import 'package:tasktick/src/data/models/login_model.dart';
import 'package:tasktick/src/domain/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with BlocEventHandler {
  final AuthRepository _authRepository;

  LoginBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const LoginState()) {
    registerEventHandler();
  }

  @override
  registerEventHandler() {
    on<LoginEventNpmChanged>(_onLoginEventNpmChanged);
    on<LoginEventPasswordChanged>(_onLoginEventPasswordChanged);
    on<LoginEventSubmited>(_onLoginEventSubmited, transformer: restartable());
    on<SkipLoginEventSubmited>(_onSkipLoginEventSubmited,
        transformer: droppable());
  }

  void _onLoginEventNpmChanged(
    LoginEventNpmChanged event,
    Emitter<LoginState> emit,
  ) {
    final npm = Npm.dirty(event.npm);
    emit(state.copyWith(
      status: Formz.validate([state.password, npm]),
      npm: npm,
    ));
  }

  void _onLoginEventPasswordChanged(
    LoginEventPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      status: Formz.validate([password, state.npm]),
      password: password,
    ));
  }

  Future<void> _onLoginEventSubmited(
    LoginEventSubmited event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
        msg: StatusLogin.connectApi,
      ));
      await Future.delayed(Duration(seconds: 1), () {});
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
        msg: StatusLogin.connectLocal,
      ));
      await Future.delayed(Duration(seconds: 2), () {});
      await _authRepository.logIn(
        npm: state.npm.value.toString(),
        password: state.password.value.toString(),
      );
      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
        msg: StatusLogin.done,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        msg: StatusLogin.failed,
      ));
    }
  }

  Future<void> _onSkipLoginEventSubmited(
    SkipLoginEventSubmited event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
        msg: StatusLogin.connectLocal,
      ));
      await Future.delayed(Duration(seconds: 2), () {});
      await _authRepository.logIn(
        npm: "Guest",
        password: "Guest",
      );
      emit(state.copyWith(
        status: FormzStatus.submissionSuccess,
        msg: StatusLogin.done,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: FormzStatus.submissionFailure,
        msg: StatusLogin.failed,
      ));
    }
  }
}
