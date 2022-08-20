import 'package:flutter/material.dart';

class OutlinedButtonWidget extends StatelessWidget {
  Text title;
  IconData icon;
  VoidCallback onPressed;

  OutlinedButtonWidget({
    Key? key,
    required Text this.title,
    required IconData this.icon,
    required VoidCallback this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(style: BorderStyle.none),
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      ),
      onPressed: onPressed,
      child: ListTile(
        leading: Icon(
          icon,
          size: 18,
        ),
        minLeadingWidth: 20,
        horizontalTitleGap: 20,
        title: title,
        contentPadding: EdgeInsets.all(0),
        dense: true,
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      ),
    );
  }
}
