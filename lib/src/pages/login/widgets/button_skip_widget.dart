import 'package:flutter/material.dart';
import 'package:tasktick/src/app/theme/color_style.dart';

class ButtonSkipWidget extends StatelessWidget {
  const ButtonSkipWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: primaryColor,
        shape: StadiumBorder(
            side: BorderSide(
          color: primaryColor,
          width: 1.5,
        )),
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          35,
        ),
        shadowColor: Colors.grey,
        elevation: 5,
      ),
      child: Text("Lewati"),
    );
  }
}
