import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/next_update_logo.png",
              scale: 7,
            ),
            Text("Next Update"),
          ],
        ),
      ),
    );
  }
}
