import 'package:flutter/material.dart';
import 'package:tasktick/src/app/theme/color_style.dart';

class ListDrawerWidget extends StatelessWidget {
  IconData icon;
  Color colorIcon;
  String text;
  GestureTapCallback onTap;
  bool? isOn;

  ListDrawerWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.colorIcon,
    required this.onTap,
    this.isOn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      visualDensity: VisualDensity(vertical: -2.5),
      leading: Icon(
        icon,
        color: colorIcon,
        size: 20,
      ),
      minLeadingWidth: 0,
      title: Text(
        "$text",
        style: TextStyle(
          fontSize: 11,
          color: secondaryColor,
        ),
      ),
      dense: true,
      tileColor: (isOn == true) ? tileSelectedColor : tileUnselectedColor,
      onTap: onTap,
    );
  }
}