// ignore_for_file: unused_field, unused_element

import 'dart:math';

import 'package:hive/hive.dart';
import 'package:objectid/objectid.dart';
import 'package:sortedmap/sortedmap.dart';
import 'package:tasktick/src/app/extension/hive/hive_box.dart';
import 'package:tasktick/src/data/services/local/hive/adapter/adapters.dart';
import '../adapter/tasks.dart';
import 'repeat_box.dart';
import 'package:time/time.dart';

class TasksBox {
  static final String _boxName = "tasks-box";

  static late Box _box;

  static Future<void> init() async {
    _box = await HiveBox.open(_boxName);

    if (_box.isEmpty) {
      await _initialData();
    }
  }

  static Future<void> add(Tasks tasks) async {
    String id = tasks.id;

    if (!_box.containsKey(id)) {
      await _box.put(id, tasks);
    }
  }

  static Future<void> update(String id, String key, dynamic value) async {
    if (find(id) != null) {
      Map tasks = find(id)!.toMap();
      tasks[key] = value;
      tasks['updatedAt'] = DateTime.now();
      await _box.put(id, Tasks.toObj(tasks));
    }
  }

  static Future<void> delete(String id) async {
    await _box.delete(id);
  }

  static Future<void> clear() async {
    await _box.clear();
  }

  static Map read({bool sorted = false}) {
    return (sorted == true) ? sort() : _box.toMap();
  }

  static Map sort() {
    Map data = read();

    return Map.fromEntries(data.entries.toList()
      ..sort((e1, e2) {
        Tasks t1 = e1.value;
        Tasks t2 = e2.value;

        return t1.time.compareTo(t2.time);
      }));
  }

  static Tasks? find(dynamic id) {
    if (read().containsKey(id)) {
      return read()[id];
    } else {
      return null;
    }
  }

  static List<Tasks> where(dynamic key, dynamic value, {bool like = false}) {
    List<Tasks> result = [];
    read().forEach((k, v) {
      v as Tasks;
      var vMap = v.toMap()[key];
      if (like == false) {
        if (vMap == value) {
          result.add(v);
        }
      } else {
        String temp = vMap.toString();
        if (temp.contains(value.toString())) {
          result.add(v);
        }
      }
    });
    return result;
  }

  static Future<void> _initialData() async {
    Map data = {
      'welcome-task': Tasks(
        id: 'welcome-task',
        title: "Hai, ini adalah Schedule Pertama anda",
        time: "08.00",
        repeat: RepeatBox.find("no-repeat")!,
        createdAt: DateTime.now(),
      ),
      'tes-everyday': Tasks(
        id: 'tes-everyday',
        title: "Tes Setiap Hari",
        time: "08.00",
        repeat: RepeatBox.find('everyday')!,
        createdAt: DateTime.now() - Random().nextInt(6).days,
      ),
      'tes-weekday': Tasks(
        id: 'tes-weekday',
        title: "Tes Hari Kerja",
        time: "08.00",
        repeat: RepeatBox.find('weekday')!,
        createdAt: DateTime.now() - Random().nextInt(6).days,
      ),
      'tes-weekend': Tasks(
        id: 'tes-weekend',
        title: "Tes Hari Libur",
        time: "08.00",
        repeat: RepeatBox.find('weekend')!,
        createdAt: DateTime.now() - Random().nextInt(6).days,
      ),
    };
    await _box.putAll(data);

    add(Tasks(
      id: ObjectId().toString(),
      title: "Tes 2 Hari Sekali",
      time: "10.00",
      repeat: Repeat(
        id: ObjectId().toString(),
        title: "2 Hari Sekali",
        reminderInterval: 2,
      ),
      createdAt: DateTime.now(),
    ));

    add(Tasks(
      id: ObjectId().toString(),
      title: "Tes 3 Hari Sekali",
      time: "10.00",
      repeat: Repeat(
        id: ObjectId().toString(),
        title: "3 Hari Sekali",
        reminderInterval: 3,
      ),
      createdAt: DateTime.now(),
    ));

    add(Tasks(
      id: ObjectId().toString(),
      title: "Tes 1 Minggu Sekali",
      time: "10.00",
      repeat: RepeatBox.find("every-1week")!,
      createdAt: DateTime.now() - 2.days,
    ));
  }
}
