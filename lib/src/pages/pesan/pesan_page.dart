import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PesanPage extends StatelessWidget {
  const PesanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 1),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => GestureDetector(
          child: ListTile(
            tileColor: Colors.white,
            // TODO: Ubah ICON menjadi no Outline apabila pesan belum dibaca
            leading: Icon(
              MdiIcons.bellOutline,
              size: 20,
            ),
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            shape: Border.all(color: Colors.grey, width: 0.2),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Amet minim quis culpa dolore.",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "31 Desember 2021 07:00",
                  style: TextStyle(
                    fontSize: 11,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
