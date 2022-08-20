import 'package:tasktick/src/app/utils/day_formater.dart';
import 'package:tasktick/src/data/services/local/hive/adapter/adapters.dart';
import 'package:tasktick/src/data/services/local/hive/box/boxes.dart';
import 'package:time/time.dart';

class TasksModel {
  static List all() {
    List list = [];
    TasksBox.read().forEach((key, value) {
      list.add(value);
    });
    return list;
  }

  static bool _checkOffset(DateTime start, DateTime selected) {
    selected = DateTime(selected.year, selected.month, selected.day);
    return selected.compareTo(start) == -1;
  }

  static getTaskByDate(DateTime dateTime) {
    List results = [];
    Days days = Days.dateTime(dateTime);

    TasksBox.read(sorted: true).forEach((key, value) {
      value as Tasks;
      DateTime start = value.startedAt!;
      int interval = value.repeat.reminderInterval;
      List except = value.repeat.except;

      // int temp = days.dateTime.day - Days.dateTime(start).dateTime.day;
      int temp = days.dateTime.difference(start).inDays;
      bool status = !ActivityBox.taskHasDone(value.id);

      if ((interval > 0) && (_checkOffset(start, dateTime) == false)) {
        if (temp % interval == 0) {
          if (except.length > 0) {
            if (!except.contains(days.indexOfDay)) {
              results.add({'status': status, 'value': value});
            }
          } else {
            results.add({'status': status, 'value': value});
          }
        }
      } else {
        if (Days.dateTime(dateTime).date == Days.now().date) {
          results.add({'status': status, 'value': value});
        }
      }
    });
    return results;
  }

  static Future<List> getByDate(DateTime dateTime) async {
    return getTaskByDate(dateTime);
  }

  static Tasks find(dynamic id) {
    return TasksBox.find(id)!;
  }
}
