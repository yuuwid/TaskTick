import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/domain/bloc/login/login_bloc.dart';

class ButtonLoginWidget extends StatelessWidget {
  ButtonLoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status.isSubmissionInProgress) {
          return Container();
        } else {
          return ElevatedButton(
            key: const Key('loginForm_login_elevatedButton'),
            onPressed: state.status.isValidated
                ? () {
                    context.read<LoginBloc>().add(LoginEventSubmited());
                  }
                : null,
            style: ElevatedButton.styleFrom(
              // shape: StadiumBorder(),
              primary: primaryColor,
              onPrimary: Colors.white,
              fixedSize: Size(
                MediaQuery.of(context).size.width,
                35,
              ),
              // shadowColor: Colors.grey,
              // elevation: 5,
            ),
            child: Text("Login"),
          );
        }
      },
    );
  }

  
}
