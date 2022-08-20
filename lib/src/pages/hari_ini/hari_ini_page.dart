import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/app/utils/day_formater.dart';
import 'package:tasktick/src/app/utils/time_formater.dart';
import 'package:tasktick/src/data/models/tasks_model.dart';
import 'package:tasktick/src/pages/home/widgets/schedule_item_widget.dart';

class HariIniPage extends StatelessWidget {
  const HariIniPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: FutureBuilder(
          future: TasksModel.getByDate(DateTime.now()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List data = snapshot.data as List;
              List onGoing = [];
              List done = [];

              data.forEach((element) {
                if (element['status'] == true) {
                  onGoing.add(element['value']);
                } else {
                  done.add(element['value']);
                }
              });

              return Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _TimeWidget(),
                    if (onGoing.length > 0)
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  child: Text(
                                    "Akan Datang",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: secondaryColor.withAlpha(140),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: List.generate(
                                    onGoing.length,
                                    (index) {
                                      return ScheduleItemWidget(
                                        tasks: {
                                          'status': true,
                                          'value': onGoing[index]
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      )
                    else
                      SizedBox(),
                    if (done.length > 0)
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(75, 158, 158, 158),
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Text(
                                "Selesai",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: secondaryColor.withAlpha(140),
                                ),
                              ),
                            ),
                            Column(
                              children: List.generate(
                                onGoing.length,
                                (index) {
                                  return ScheduleItemWidget(
                                    tasks: {
                                      'status': false,
                                      'value': onGoing[index]
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      SizedBox(),
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          }),
    );
  }
}

class _TimeWidget extends StatelessWidget {
  const _TimeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: _ClockWidget(),
    );
  }
}

class _ClockWidget extends StatefulWidget {
  const _ClockWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<_ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<_ClockWidget> {
  @override
  Widget build(BuildContext context) {
    final dateTime = Days.now();
    return StreamBuilder(
      stream: Stream.periodic(Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              DayFormater.indo(dateTime.dayName) +
                  ", " +
                  DateFormat("dd MMMM yyyy").format(dateTime.dateTime),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 4),
            Text(
              DateFormat("hh:mm:ss").format(DateTime.now()),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        );
      },
    );
  }
}
