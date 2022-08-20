import 'package:flutter/material.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/app/utils/day_formater.dart';
import 'package:tasktick/src/data/models/tasks_model.dart';
import 'package:tasktick/src/pages/home/widgets/schedule_item_widget.dart';

class DayScheduleWidget extends StatelessWidget {
  final int dayIndex;

  DayScheduleWidget({Key? key, required this.dayIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 10,
            ),
            child: Text(
              "${DayFormater.getNamebyIndex(dayIndex)}",
              style: TextStyle(
                fontSize: 12,
                color: secondaryColor.withAlpha(140),
              ),
            ),
          ),
          FutureBuilder(
            future: TasksModel.getByDate(Days.indexDay(dayIndex).dateTime),
            builder: (context, tasks) {
              if (tasks.connectionState == ConnectionState.done) {
                List data = tasks.data as List;
                return Column(
                  children: List.generate(data.length, (index) {
                    return ScheduleItemWidget(tasks: data[index]);
                  }),
                );
              } else {
                return Card();
              }
            },
          ),
        ],
      ),
    );
  }
}
