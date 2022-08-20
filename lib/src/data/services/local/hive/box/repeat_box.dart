// ignore_for_file: unused_field, unused_element

import 'package:hive/hive.dart';
import 'package:tasktick/src/app/extension/hive/hive_box.dart';
import '../adapter/repeat.dart';

class RepeatBox {
  static final String _boxName = "repeat-box";

  static late Box _box;

  static Future<void> init() async {
    _box = await HiveBox.open(_boxName);

    if (_box.isEmpty) {
      await _initialData();
    }
  }

  static Future<void> add(Repeat repeat) async {
    String id = repeat.id;

    if (!_box.containsKey(id)) {
      await _box.put(id, repeat);
    }
  }

  static Future<void> update(String id, String key, dynamic value) async {
    if (find(id) != null) {
      Map repeat = find(id)!.toMap();
      repeat[key] = value;
      _box.put(id, Repeat.toObj(repeat));
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

  static Repeat? find(dynamic id) {
    if (read().containsKey(id)) {
      return read()[id];
    } else {
      return null;
    }
  }

  static List<Repeat> where(dynamic key, dynamic value, {bool like = false}) {
    List<Repeat> result = [];
    read().forEach((k, v) {
      v as Repeat;
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
      "no-repeat": Repeat(
        id: 'no-repeat',
        title: "Tidak ada",
        reminderInterval: 0,
      ),
      'everyday': Repeat(
        id: 'everyday',
        title: "Setiap Hari",
        reminderInterval: 1,
      ),
      'weekday': Repeat(
        id: 'weekday',
        title: "Hari Kerja",
        reminderInterval: 1,
        except: [6, 0],
      ),
      'weekend': Repeat(
        id: 'weekend',
        title: "Akhir Pekan",
        reminderInterval: 1,
        except: [1, 2, 3, 4, 5],
      ),
      'every-1week': Repeat(
        id: 'every-1week',
        title: "Setiap 1 Minggu",
        reminderInterval: 7,
      ),
      'every-1month': Repeat(
        id: 'every-1month',
        title: "Setiap 1 Bulan",
        reminderInterval: 30,
      ),
      'every-year': Repeat(
        id: 'every-year',
        title: "Setiap 1 Tahun",
        reminderInterval: 365,
      ),
    };
    await _box.putAll(data);
  }
}
