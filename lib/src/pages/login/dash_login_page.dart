import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/domain/bloc/login/login_bloc.dart';
import 'package:tasktick/src/domain/repositories/auth_repository.dart';
import 'package:tasktick/src/pages/login/widgets/dialogs_widget.dart';

class DashLoginPage extends StatelessWidget {
  const DashLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;
    final bodyScreen = screen - paddingTop;

    return Scaffold(
      body: BlocProvider(
        create: (_) => LoginBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: SingleChildScrollView(
          child: Container(
            height: screen,
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Column(
              children: [
                Container(
                  height: (0.2 * bodyScreen) + paddingTop,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Selamat Datang",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "OpenSans",
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Buat hari-hari mu menjadi produktif dan mudah.",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "OpenSans",
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 0.55 * bodyScreen,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/splash_logo.png",
                        height: (0.5 * bodyScreen) * 0.5,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  height: 0.25 * bodyScreen,
                  child: BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      DialogsWidget.show(state, context);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            child: Text("LOGIN"),
                          ),
                          style: ElevatedButton.styleFrom(
                            onPrimary: primaryColor,
                            primary: Colors.white,
                            shape: StadiumBorder(),
                            side: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed("/login");
                          },
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Masuk sebagai Tamu?",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 5),
                        BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {},
                          builder: (context, state) => GestureDetector(
                            child: Text(
                              "Lewati",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              context
                                  .read<LoginBloc>()
                                  .add(SkipLoginEventSubmited());
                            },
                          ),
                        ),
                        // SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
