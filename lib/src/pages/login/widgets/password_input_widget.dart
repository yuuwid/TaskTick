import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/domain/bloc/login/login_bloc.dart';
import 'package:tasktick/src/pages/login/widgets/input_decoration_widget.dart';

class PasswordInputWidget extends StatelessWidget {
  const PasswordInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhysicalModel(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
            elevation: 0.5,
            shadowColor: Colors.grey,
            child: BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (previous, current) =>
                  previous.password != current.password,
              builder: (context, state) => TextFormField(
                key: const Key("loginForm_passwordInput_textFormField"),
                // initialValue: state.password.value,
                textInputAction: TextInputAction.done,
                autofocus: false,
                autocorrect: false,
                cursorHeight: 15,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecorationWidget.build(
                  label: "Masukan Password",
                  icon: MdiIcons.eye,
                ),
                style: TextStyle(fontSize: 11),
                onChanged: (value) {
                  context
                      .read<LoginBloc>()
                      .add(LoginEventPasswordChanged(value));
                },
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "*Kami tidak akan menyimpan "),
                  TextSpan(
                      text: "\"Password\" ",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: " Anda kedalam database kami."),
                ],
              ),
              style: TextStyle(
                fontSize: 9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
