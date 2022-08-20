import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/domain/bloc/task/task_cubit.dart';
import '../../app/theme/color_style.dart';
import 'widgets/content_widget.dart';
import 'widgets/header_widget.dart';
import 'widgets/option_modal_bottom_widget.dart';

class TaskPage extends StatelessWidget {
  TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Jadwal",
          style: TextStyle(color: primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _openOptionBtmSheet(context);
            },
            icon: Icon(MdiIcons.dotsVertical),
            splashRadius: 20,
          ),
        ],
      ),
      body: BodyApp(),
    );
  }

  _openOptionBtmSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return OptionsModalBottomWidget();
      },
    );
  }
}

class BodyApp extends StatelessWidget {
  BodyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeaderWidgets(),
          Expanded(child: ContentWidgets()),
        ],
      ),
    );
  }
}
