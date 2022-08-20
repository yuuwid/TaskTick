// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/domain/bloc/drawer/drawer_cubit.dart';
import 'package:tasktick/src/pages/drawer/widgets/list_drawer_widget.dart';

enum DrawerOpened {
  home,
  hari_ini,
  pesan,
  todo,
  note,
}

// !TODO : Pakai BLoc untuk Navigasi Drawer
class DrawerWidget extends StatelessWidget {
  DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        return Column(
          children: [
            ListDrawerWidget(
              text: "Home",
              icon: MdiIcons.homeOutline,
              colorIcon: drawerIconColor['homeIcon'] as Color,
              isOn: (state.opened == DrawerOpened.home),
              onTap: () {
                context.read<DrawerCubit>().toHome();
                Navigator.pop(context);
                // Navigator.pop(context);
                // Navigator.pushNamed(context, Routes.dashboard);
              },
            ),
            ListDrawerWidget(
              text: "Hari ini",
              icon: MdiIcons.calendarTodayOutline,
              colorIcon: drawerIconColor['hariIniIcon'] as Color,
              isOn: (state.opened == DrawerOpened.hari_ini),
              onTap: () {
                context.read<DrawerCubit>().toHariIni();
                Navigator.pop(context);
                // Navigator.pop(context);
                // Navigator.pushNamed(context, Routes.hari_ini);
              },
            ),
            ListDrawerWidget(
              text: "Pesan",
              icon: MdiIcons.mailboxOutline,
              colorIcon: drawerIconColor['pesanIcon'] as Color,
              isOn: (state.opened == DrawerOpened.pesan),
              onTap: () {
                context.read<DrawerCubit>().toPesan();
                Navigator.pop(context);
                // Navigator.pop(context);
                // Navigator.pushNamed(context, Routes.home);
              },
            ),
            ListDrawerWidget(
              text: "ToDo's",
              icon: MdiIcons.formatListChecks,
              colorIcon: drawerIconColor['todoIcon'] as Color,
              isOn: (state.opened == DrawerOpened.todo),
              onTap: () {
                context.read<DrawerCubit>().toToDo();
                Navigator.pop(context);
                // Navigator.pop(context);
                // Navigator.pushNamed(context, Routes.home);
              },
            ),
            ListDrawerWidget(
              text: "Note",
              icon: MdiIcons.notebookEditOutline,
              colorIcon: drawerIconColor['noteIcon'] as Color,
              isOn: (state.opened == DrawerOpened.note),
              onTap: () {
                context.read<DrawerCubit>().toNote();
                Navigator.pop(context);
                // Navigator.pop(context);
                // Navigator.pushNamed(context, Routes.home);
              },
            ),
          ],
        );
      },
    );
  }
}
