import 'package:shared_preferences/shared_preferences.dart';

enum PrefType {
  string,
  int,
  bool,
  double,
  stringList,
}

class LocalStorage {
  static void saveData({
    required String key,
    required dynamic value,
    PrefType type = PrefType.string,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (type) {
      case PrefType.int:
        await prefs.setInt(key, value);
        break;
      case PrefType.bool:
        await prefs.setBool(key, value);
        break;
      case PrefType.double:
        await prefs.setDouble(key, value);
        break;
      case PrefType.stringList:
        await prefs.setStringList(key, value);
        break;

      default:
        await prefs.setString(key, value);
    }
  }

  static Future getData(String key, {PrefType type = PrefType.string}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    switch (type) {
      case PrefType.int:
        return await prefs.getInt(key);
      case PrefType.bool:
        return await prefs.getBool(key);
      case PrefType.double:
        return await prefs.getDouble(key);
      case PrefType.stringList:
        return await prefs.getStringList(key);
      default:
        return await prefs.getString(key);
    }
  }

  static Future<bool> removeData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.remove('counter');
  }
}
