import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/domain/bloc/drawer/drawer_cubit.dart';
import 'package:tasktick/src/pages/pages.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedItemPosition = 0;
  var appBar;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrawerCubit(),
      child: BlocBuilder<DrawerCubit, DrawerState>(
        builder: (context, state) {
          return Scaffold(
            appBar: (_selectedItemPosition != 0)
                ? null
                : ReusableWidgets.appBarDashboard(context, state.title),
            drawer: (_selectedItemPosition != 0) ? null : DrawerHome(),
            floatingActionButton: _createFloatingButton(state),
            bottomNavigationBar: SnakeNavigationBar.color(
              snakeViewColor: primaryColor,
              height: 45,
              snakeShape: SnakeShape.indicator,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(MdiIcons.homeOutline), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(MdiIcons.calendarMonthOutline),
                    label: "Kalender"),
                BottomNavigationBarItem(
                    icon: Icon(MdiIcons.accountCogOutline), label: "Profil"),
              ],
              currentIndex: _selectedItemPosition,
              onTap: (index) => setState(() => _selectedItemPosition = index),
            ),
            body: _PageBuilderWidget(page: _selectedItemPosition),
          );
        },
      ),
    );
  }

  _createFloatingButton(DrawerState state) {
    switch (state.opened) {
      case DrawerOpened.home:
        return ReusableWidgets.floatingButtonDashboard(
          icon: MdiIcons.plus,
          tooltip: "Tambah Jadwal",
          onPressed: () {},
        );
      case DrawerOpened.todo:
        return ReusableWidgets.floatingButtonDashboard(
          icon: MdiIcons.plus,
          tooltip: "Tambah Aktivitas",
          onPressed: null,
        );
      case DrawerOpened.note:
        return ReusableWidgets.floatingButtonDashboard(
          icon: MdiIcons.notebookPlusOutline,
          tooltip: "Tambah Catatan",
          onPressed: null,
        );
      default:
        return null;
    }
  }
}

class _PageBuilderWidget extends StatelessWidget {
  int? page;

  _PageBuilderWidget({
    Key? key,
    int? this.page = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        switch (page) {
          case 1:
            return CalendarPage();
          case 2:
            return Container();
          default:
            return _PageDrawerBuilderWidget();
        }
      },
    );
  }
}

class _PageDrawerBuilderWidget extends StatelessWidget {
  _PageDrawerBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        return Builder(
          builder: (context) {
            // !TODO: Pasang BLoc dan Switch Case untuk menerima navigasi dari WidgetDrawer
            switch (state.opened) {
              case DrawerOpened.home:
                return HomePage();
              case DrawerOpened.hari_ini:
                return HariIniPage();
              case DrawerOpened.pesan:
                return PesanPage();
              case DrawerOpened.todo:
                return TodoSPage();
              case DrawerOpened.note:
                return NotePage();
              default:
                return Container();
            }
          },
        );
      },
    );
  }
}
