import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/domain/bloc/auth/auth_bloc.dart';
import 'package:tasktick/src/pages/pages.dart';

class ReusableWidgets {
  static AppBar appBarDashboard(context, title) {
    return AppBar(
      title: Text(
        "$title",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
      actions: [
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) => IconButton(
            onPressed: () async {
              Dialogs.bottomMaterialDialog(
                context: context,
                isDismissible: false,
                barrierDismissible: false,
                enableDrag: false,
                title: "Sedang Logout",
                customView: Container(
                  padding: EdgeInsets.only(top: 30),
                  child: CircularProgressIndicator(),
                ),
              );
              context.read<AuthBloc>().add(AuthEventLogout());
              Future.delayed(Duration(seconds: 2), () {});
            },
            tooltip: "Laporkan Bug",
            icon: Icon(MdiIcons.bugOutline),
            splashRadius: 20,
          ),
        )
      ],
    );
  }

  static floatingButtonDashboard({
    required VoidCallback? onPressed,
    required IconData icon,
    String? tooltip,
  }) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
      mini: true,
      backgroundColor:
          (onPressed != null) ? primaryColor : primaryColor.withOpacity(0.7),
    );
  }
}
