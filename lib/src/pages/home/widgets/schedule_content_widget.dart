import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasktick/src/data/services/local/hive/adapter/adapters.dart';
import 'package:tasktick/src/domain/bloc/task/task_cubit.dart';
import 'package:tasktick/src/routes.dart';

class ScheduleContentWidget extends StatelessWidget {
  final Tasks tasks;
  final bool status;
  ScheduleContentWidget({
    Key? key,
    required this.tasks,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (status) ? Colors.white : Colors.grey[300],
      child: ListTile(
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 0,
        ),
        leading: Container(
          width: 5,
          color: Colors.red,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${tasks.title}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                (tasks.repeat.reminderInterval != 0)
                    ? Icon(
                        Icons.repeat,
                        color: Colors.green,
                        size: 12,
                      )
                    : SizedBox(),
                (tasks.repeat.reminderInterval != 0)
                    ? SizedBox(width: 5)
                    : SizedBox(),
                Icon(
                  MdiIcons.bell,
                  size: 12,
                ),
                SizedBox(width: 3),
                Icon(
                  MdiIcons.exclamationThick,
                  color: (tasks.priority == 0)
                      ? Colors.grey
                      : (tasks.priority == 1)
                          ? Colors.amber
                          : Colors.red,
                  size: 12,
                ),
              ],
            )
          ],
        ),
        trailing: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "${tasks.time}",
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ),
        onTap: () {
          // !TODO: add Bloc;
          context.read<TaskCubit>().onSelectTask(tasks.id);
          Navigator.pushNamed(context, Routes.task);
        },
        onLongPress: () {},
      ),
    );
  }
}
