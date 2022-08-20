import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/app/theme/color_style.dart';

class DrawerBottomWidget extends StatelessWidget {
  const DrawerBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      visualDensity: VisualDensity(vertical: -2.5),
      leading: Icon(
        MdiIcons.cogOutline,
        color: Colors.black,
        size: 18,
      ),
      minLeadingWidth: 0,
      title: Text(
        "Pengaturan",
        style: TextStyle(
          fontSize: 11,
          color: secondaryColor,
        ),
      ),
      dense: true,
      onTap: () {},
    );
  }
}
