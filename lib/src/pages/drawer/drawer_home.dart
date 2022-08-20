import 'package:flutter/material.dart';
import 'package:tasktick/src/pages/drawer/widgets/drawer_bottom_widget.dart';
import 'package:tasktick/src/pages/drawer/widgets/drawer_header_widget.dart';
import 'package:tasktick/src/pages/drawer/widgets/drawer_widget.dart';

export 'package:tasktick/src/pages/drawer/widgets/drawer_widget.dart';

class DrawerHome extends StatelessWidget {
  DrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeaderWidget(),
          Container(
            child: DrawerWidget(),
          ),
          Spacer(),
          Container(
            child: DrawerBottomWidget(),
          ),
        ],
      ),
    );
  }
}
