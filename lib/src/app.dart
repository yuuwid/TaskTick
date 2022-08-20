// ignore_for_file: unused_element, unused_local_variable

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasktick/src/app/theme/app_theme.dart';
import 'package:tasktick/src/domain/bloc/auth/auth_bloc.dart';
import 'package:tasktick/src/domain/bloc/task/task_cubit.dart';
import 'package:tasktick/src/domain/repositories/auth_repository.dart';
import 'package:tasktick/src/domain/repositories/user_repository.dart';
import 'package:tasktick/src/pages/pages.dart';
import 'package:tasktick/src/routes.dart';

class App extends StatelessWidget {
  App({
    super.key,
    required this.authRepository,
    required this.userRepository,
  });

  final AuthRepository authRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return RepositoryProvider.value(
      value: authRepository,
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            authRepository: authRepository,
            userRepository: userRepository,
          ),
        ),
        BlocProvider(
          create: (_) => TaskCubit(),
        )
      ], child: _AppView()),
    );
  }
}

class _AppView extends StatefulWidget {
  _AppView({super.key});

  @override
  State<_AppView> createState() => _AppViewState();
}

class _AppViewState extends State<_AppView> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthStatus prevStatus = AuthStatus.unknown;
    AuthStatus currentStatus = AuthStatus.unknown;

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      locale: Locale("id", "ID"),
      theme: AppTheme.build(),
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) async {
            // print("materialApp: ${ state.status}");
            currentStatus = state.status;
            await Future.delayed(
              Duration(seconds: 2),
              () {
                switch (currentStatus) {
                  case AuthStatus.authenticated:
                    if ((currentStatus == AuthStatus.authenticated) &&
                        (prevStatus == AuthStatus.unauthenticated)) {
                      navigatorKey.currentState!.pushNamedAndRemoveUntil(
                          Routes.dashboard, (route) => false);
                    }
                    return;
                  case AuthStatus.unauthenticated:
                    navigatorKey.currentState!.pushNamedAndRemoveUntil<void>(
                        Routes.dash_login, (route) => false);
                    return;
                  case AuthStatus.unknown:
                    // TODO: Handle this case.
                    break;
                }
              },
            );
            prevStatus = state.status;
          },
          child: child,
        );
      },
      onGenerateRoute: Routes.generateRoute,
      // initialRoute: "/",
      // home: TaskPage(),
    );
  }
}
