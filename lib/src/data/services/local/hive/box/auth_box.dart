// ignore_for_file: unused_element

import 'package:hive/hive.dart';
import 'package:tasktick/src/app/extension/hive/hive_box.dart';

class AuthBox {
  static String _boxName = "auth";

  static Future<Box> get _box async => await HiveBox.open(_boxName);

  static Future<Map> get authBox async => await HiveBox.loadBox(await _box);

  static Future<void> init() async {
    Map _authBox = {
      '_id': null,
      'logged': false,
      'npm': null,
      'nama_lengkap': null,
      'password': null,
    };
    await HiveBox.init(await _box, _authBox);
  }

  static Future<void> clear() async {
    await HiveBox.clear(await _box, eager: true);
  }

  static Future<void> updateAll(Map data) async {
    await HiveBox.updateAll(await _box, data);
  }
}
