import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasktick/src/domain/bloc/login/login_bloc.dart';
import 'package:tasktick/src/domain/repositories/auth_repository.dart';
import 'package:tasktick/src/pages/login/widgets/button_login_widget.dart';
import 'package:tasktick/src/pages/login/widgets/dialogs_widget.dart';
import 'package:tasktick/src/pages/login/widgets/npm_input_widget.dart';
import 'package:tasktick/src/pages/login/widgets/password_input_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stateMsg = null;
    return BlocProvider(
      create: (context) {
        return LoginBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        );
      },
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            DialogsWidget.show(state, context);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NpmInputWidget(),
              PasswordInputWidget(),
              SizedBox(height: 25),
              ButtonLoginWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
