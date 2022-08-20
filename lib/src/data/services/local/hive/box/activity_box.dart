// ignore_for_file: unused_field, unused_element

import 'package:hive/hive.dart';
import 'package:tasktick/src/app/extension/hive/hive_box.dart';
import '../adapter/activity.dart';

class ActivityBox {
  static final String _boxName = "activity-box";

  static late Box _box;

  static Future<void> init() async {
    _box = await HiveBox.open(_boxName);

    if (_box.isEmpty) {
      await _initialData();
    }
  }

  static bool taskHasDone(String id) {
    Activity? activity = find(id);
    if ((activity != null) &&
        (activity.taskId == id) &&
        (activity.doneAt != null)) {
      return true;
    }
    return false;
  }

  static Future<void> add(Activity activity) async {
    String id = activity.id;

    if (!_box.containsKey(id)) {
      await _box.put(id, activity);
    }
  }

  static Future<void> update(String id, String key, dynamic value) async {
    if (find(id) != null) {
      Map activity = find(id)!.toMap();
      activity[key] = value;
      await _box.put(id, Activity.toObj(activity));
    }
  }

  static Future<void> delete(String id) async {
    await _box.delete(id);
  }

  static Future<void> clear() async {
    await _box.clear();
  }

  static Map read() {
    return _box.toMap();
  }

  static Activity? find(dynamic id) {
    if (read().containsKey(id)) {
      return read()[id];
    } else {
      return null;
    }
  }

  static List<Activity> where(dynamic key, dynamic value, {bool like = false}) {
    List<Activity> result = [];
    read().forEach((k, v) {
      v as Activity;
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
    Map data = {};
    await _box.putAll(data);
  }
}
