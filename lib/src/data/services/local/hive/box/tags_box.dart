// ignore_for_file: unused_field, unused_element

import 'package:hive/hive.dart';
import 'package:tasktick/src/app/extension/hive/hive_box.dart';
import '../adapter/tags.dart';

class TagsBox {
  static final String _boxName = "tags-box";

  static late Box _box;

  static Future<void> init() async {
    _box = await HiveBox.open(_boxName);

    if (_box.isEmpty) {
      await _initialData();
    }
  }

  static Future<void> add(Tags tag) async {
    String id = tag.id;

    if (!_box.containsKey(id)) {
      await _box.put(id, tag);
    }
  }

  static Future<void> update(String id, String key, dynamic value) async {
    if (find(id) != null) {
      Map tag = find(id)!.toMap();
      tag[key] = value;
      await _box.put(id, Tags.toObj(tag));
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

  static Tags? find(dynamic id) {
    if (read().containsKey(id)) {
      return read()[id];
    } else {
      return null;
    }
  }

  static List<Tags> where(dynamic key, dynamic value, {bool like = false}) {
    List<Tags> result = [];
    read().forEach((k, v) {
      v as Tags;
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
