import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/pages/login/widgets/login_form_widget.dart';
import 'package:tasktick/src/pages/login/widgets/login_header_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;
    final bodyScreen = screen - paddingTop;

    final AppBar appBar = AppBar(
      leading: Container(),
      leadingWidth: 0,
      titleSpacing: 0,
      title: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(0),
        child: GestureDetector(
          child: Row(
            children: [
              Icon(
                MdiIcons.chevronLeft,
              ),
              Text(
                "Kembali",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          // height: bodyScreen - appBar.preferredSize.height - 60,
          child: Column(
            children: [
              SizedBox(height: 10),
              LoginHeaderWidget(),
              SizedBox(height: 30),
              LoginFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
