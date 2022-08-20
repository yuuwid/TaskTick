import 'package:flutter/material.dart';
import 'package:tasktick/src/app/theme/color_style.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        right: 35,
        left: 35,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/login_logo_header.png",
            height: 100,
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "TaskTick",
              style: TextStyle(
                fontFamily: "Loto",
                color: primaryColor,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Login",
              style: TextStyle(
                fontFamily: "OpenSans",
                color: primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
