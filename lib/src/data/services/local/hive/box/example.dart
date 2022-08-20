// ignore_for_file: prefer_final_fields, unused_element

import 'package:hive/hive.dart';
import 'package:tasktick/src/app/extension/hive/hive_box.dart';

class _ExampleBox {
  static String _boxName = "example";

  static Future<Box> get _box async => await HiveBox.open(_boxName);

  static Future<Map> get exampleBox async => await HiveBox.loadBox(await _box);

  static Future<void> init() async {
    Map _exampleBox = {
      '_id': "ABCDEFG",
      'primaryColor': "red",
      'secondaryColor': "blue",
    };
    await HiveBox.init(await _box, _exampleBox);
  }

  static Future<void> put(String key, dynamic value) async {
    await HiveBox.put(await _box, key, value);
  }

  static Future<void> puts(Map data) async {
    await HiveBox.puts(await _box, data);
  }

  static Future<void> update(String key, String value) async {
    await HiveBox.update(await _box, key, value);
  }

  static Future<void> delete(String key) async {
    await HiveBox.delete(await _box, key);
  }

  static Future<void> clear() async {
    await HiveBox.clear(await _box, except: ["_id"]);
  }
}
