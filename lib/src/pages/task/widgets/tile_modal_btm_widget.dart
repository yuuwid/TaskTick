import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/pages/task/widgets/outlined_button_widget.dart';

class TileModalBtmWidget extends StatelessWidget {
  const TileModalBtmWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButtonWidget(
          onPressed: () {},
          icon: MdiIcons.tag,
          title: Text(
            "Tags",
            style: TextStyle(fontSize: 12),
          ),
        ),
        SizedBox(height: 5),
        OutlinedButtonWidget(
          onPressed: () {},
          icon: MdiIcons.message,
          title: Text(
            "Komentar",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
