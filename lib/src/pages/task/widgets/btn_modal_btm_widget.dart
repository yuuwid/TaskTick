import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BtnModalBtmWidget extends StatelessWidget {
  const BtnModalBtmWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                MdiIcons.share,
                size: 18,
              ),
              label: Text("Bagikan"),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                visualDensity: VisualDensity.comfortable,
                primary: Colors.green,
              ),
            ),
          ),
          SizedBox(width: 25),
          // TODO: Pasang Bloc
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                MdiIcons.trashCanOutline,
                size: 18,
              ),
              label: Text("Hapus"),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                visualDensity: VisualDensity.comfortable,
                primary: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
