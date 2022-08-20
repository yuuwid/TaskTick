import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tasktick/src/app/theme/color_style.dart';
import 'package:tasktick/src/data/models/tasks_model.dart';
import 'package:tasktick/src/pages/home/widgets/schedule_item_widget.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerCalendar(),
                _tableCalendar(),
              ],
            ),
          ),
          _eventCalendar(),
        ],
      ),
    );
  }

  Padding _headerCalendar() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Row(
              children: [
                Icon(
                  MdiIcons.calendar,
                  color: primaryColor,
                  size: 21,
                ),
                SizedBox(width: 5),
                Text(
                  DateFormat('MMMM yyyy', 'id_ID').format(_selectedDay),
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            onTap: () {
              setState(() {});
              _selectedDay = DateTime.now();
              _focusedDay = DateTime.now();
            },
          ),
          IconButton(
            padding: EdgeInsets.all(0),
            visualDensity: VisualDensity.compact,
            icon: Icon(
              (_calendarFormat == CalendarFormat.week)
                  ? MdiIcons.calendarMonthOutline
                  : MdiIcons.calendarWeekOutline,
              color: primaryColor,
            ),
            onPressed: () {
              setState(() {
                if (_calendarFormat == CalendarFormat.week) {
                  _calendarFormat = CalendarFormat.month;
                } else {
                  _calendarFormat = CalendarFormat.week;
                }
              });
            },
            tooltip: (_calendarFormat == CalendarFormat.week)
                ? "Bulanan"
                : "Mingguan",
          )
        ],
      ),
    );
  }

  TableCalendar<dynamic> _tableCalendar() {
    return TableCalendar(
      firstDay: DateTime(DateTime.now().year - 2, 1, 1),
      lastDay: DateTime(DateTime.now().year + 2, 12, 31),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      headerVisible: false,
      locale: "id",
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onPageChanged: (date) {
        setState(() {});
        _selectedDay = date;
        _focusedDay = date;
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
    );
  }

  Expanded _eventCalendar() {
    return Expanded(
      child: SingleChildScrollView(
        child: FutureBuilder(
          future: TasksModel.getByDate(_selectedDay),
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
      ),
    );
  }
}
