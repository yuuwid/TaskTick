import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/domain/bloc/auth/auth_bloc.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.all(20),
        color: primaryColor,
        child: Row(
          children: [
            Container(
              width: 75,
              child: CircleAvatar(
                child: Image.asset("assets/images/person.png"),
                radius: 75,
              ),
            ),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.select((AuthBloc bloc) => bloc.state.user.name),
                  style: TextStyle(
                    color: textPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                GestureDetector(
                  child: Icon(MdiIcons.accountOutline, size: 20),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
