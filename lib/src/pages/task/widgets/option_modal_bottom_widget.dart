import 'package:flutter/material.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/pages/task/widgets/btn_modal_btm_widget.dart';
import 'package:tasktick/src/pages/task/widgets/tile_modal_btm_widget.dart';

class OptionsModalBottomWidget extends StatelessWidget {
  const OptionsModalBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 2,
              margin: EdgeInsets.only(bottom: 10),
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: primaryColor,
              ),
            ),
          ),
          TileModalBtmWidget(),
          SizedBox(height: 20),
          BtnModalBtmWidget(),
        ],
      ),
    );
  }
}
