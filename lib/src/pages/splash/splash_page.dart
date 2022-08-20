import 'package:flutter/material.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/pages/pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: splashColor,
        ),
        child: Center(
          child: Image.asset(
            "assets/images/splash_logo.png",
            scale: 5,
          ),
        ),
      ),
    );
  }
}
