import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/pages/home/widgets/schedule_content_widget.dart';

class ScheduleItemWidget extends StatelessWidget {
  final Map tasks;
  ScheduleItemWidget({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      // direction: DismissDirection.endToStart,
      dismissThresholds: {DismissDirection.endToStart: 0.55},
      // Delete
      background: Container(
        padding: EdgeInsets.only(left: 15),
        alignment: Alignment.centerLeft,
        color: Colors.green,
        child: Icon(
          MdiIcons.checkAll,
          color: Colors.white,
        ),
      ),
      // Selesai
      secondaryBackground: Container(
        padding: EdgeInsets.only(right: 15),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(
          MdiIcons.trashCan,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (direction) {
        print(direction);
        if (direction == DismissDirection.endToStart) {
          return Future(() => false);
        } else {
          return Future(() => true);
        }
      },
      child:
          ScheduleContentWidget(tasks: tasks['value'], status: tasks['status']),
    );
  }
}
