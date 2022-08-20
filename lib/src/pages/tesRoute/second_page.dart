import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("FirstPage"),
          onPressed: () {
            Navigator.of(context).pushNamed("/first");
          },
        ),
      ),
    );
  }
}
