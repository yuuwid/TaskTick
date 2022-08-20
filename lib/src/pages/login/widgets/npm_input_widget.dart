import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/domain/bloc/login/login_bloc.dart';
import 'package:tasktick/src/pages/login/widgets/input_decoration_widget.dart';

class NpmInputWidget extends StatelessWidget {
  NpmInputWidget({
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
              buildWhen: (previous, current) => previous.npm != current.npm,
              builder: (context, state) => TextFormField(
                key: const Key("loginForm_npmInput_textFormField"),
                // initialValue: (state.npm.value),
                textInputAction: TextInputAction.next,
                autofocus: false,
                autocorrect: false,
                cursorHeight: 15,
                keyboardType: TextInputType.number,
                decoration: InputDecorationWidget.build(
                  label: "Masukan NPM",
                  icon: MdiIcons.numeric,
                ),
                style: TextStyle(fontSize: 11),
                onChanged: (value) {
                  context.read<LoginBloc>().add(LoginEventNpmChanged(value));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
