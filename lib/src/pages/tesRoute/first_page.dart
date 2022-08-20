import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/app/theme/font_family.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("REBUILD");
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<Box>(
          valueListenable: Hive.box("settings").listenable(),
          builder: (context, box, child) {
            var result = box.get("primary_font_family");
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$result"),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      textStyle: TextStyle(
                        fontFamily: primaryFontFamily,
                      )),
                  child: Text("Change Font"),
                  onPressed: () {
                    
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
