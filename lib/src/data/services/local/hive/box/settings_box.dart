import 'package:hive/hive.dart';
import 'package:tasktick/src/app/extension/hive/hive_box.dart';
import 'package:uuid/uuid.dart';

class AppSettingsBox {
  static String _boxName = "settings";

  static Future<Box> get _box async => await HiveBox.open(_boxName);

  static Future<Map> get settingsBox async => await HiveBox.loadBox(await _box);

  static Future<void> init() async {
    Map _settingsBox = {
      '_id': Uuid().v4(),
    };
    await HiveBox.init(await _box, _settingsBox);
  }

  static Future<void> clear() async {
    await HiveBox.clear(await _box, eager: false);
  }
}
