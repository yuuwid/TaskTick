import 'package:hive_flutter/hive_flutter.dart';

class HiveBox {
  /// Daftarkan Object Box Hive dalam bentuk [Map<String, dynamic>]
  ///
  /// tambahkan id box dengan penulisan nama key nya diawali dengan garis bawah <br>
  /// id box boleh lebih dari satu.
  static Future<void> init(
    Box box,
    Map data, {
    List except = const [],
  }) async {
    
    if (box.isEmpty) {
      await box.putAll(data);
    } else {
      Map dataBox = box.toMap();
      await box.putAll(dataBox);
    }
  }

  static Future<Box> open(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    } else {
      return await Hive.openBox(boxName);
    }
  }


  static Future<Map> loadBox(Box box) async {
    return box.toMap();
  }

  /// menambahkan 1 buah data berupa key dan value
  static Future<void> put(Box box, String key, dynamic value) async {
    await box.put(key, value);
  }

  /// menambahkan beberapa data
  static Future<void> puts(Box box, Map data) async {
    await box.putAll(data);
  }

  /// Contoh:
  /// Box Name = "user"
  ///
  /// ```
  /// data = {
  ///   '_id': 12345,
  ///   'name': 'Flutter',
  ///   'social_media': {
  ///       'instagram': 'flutter',
  ///       'twitter': 'flutter'
  ///   },
  /// }
  /// ```
  ///
  /// untuk mengupdate data yang hanya bersifat 1 level, cukup masukan
  /// key nya secara langsung.
  /// 
  /// ```
  /// HiveBox.update("user", "name", "new_value");
  /// ```
  ///
  /// untuk mengupdate data yang merupakan Nested Data, maka dapat memasukan
  /// key nya dari level 1 sampai ke level data yang dituju dan dipisahkan dengan
  /// tanda titik (.)
  /// 
  /// ```
  /// HiveBox.update("user", "social_media.instagram", "new_value");
  /// ```
  ///
  /// Saat ini level nested yang didukung hanya sampai level 5.
  static Future<void> update(Box box, String key, dynamic value) async {
    if (!key.contains(".")) {
      await box.put(key, value);
    } else if (key.contains(".")) {
      List keyList = key.split(".").toList();
      if (keyList.length > 1) {
        await _deepUpdate(box, keyList, value);
      } else {
        print("Failed to update data");
      }
    }
  }

  static Future<void> updateAll(Box box, Map data) async {
    data.forEach((key, value) async {
      await update(box, key, value);
    });
  }

  static Future<void> _deepUpdate(Box box, List key, dynamic value) async {
    var root = await box.get(key[0]) as Map;

    switch (key.length) {
      case 2:
        root[key[1]] = value;
        break;
      case 3:
        root[key[1]][key[2]] = value;
        break;
      case 4:
        root[key[1]][key[2]][key[3]] = value;
        break;
      case 5:
        root[key[1]][key[2]][key[3]][key[4]] = value;
        break;
      default:
        break;
    }

    await box.put(key[0], root);
  }

  /// Contoh:
  /// Box Name = "user"
  ///
  /// <pre>
  /// data = {
  ///   '_id': 12345,
  ///   'name': 'Flutter',
  ///   'social_media': {
  ///       'instagram': 'flutter',
  ///       'twitter': 'flutter'
  ///   },
  /// }
  /// </pre>
  ///
  /// untuk menghapus data yang hanya bersifat 1 level, cukup masukan
  /// key nya secara langsung.
  /// <pre>HiveBox.delete("user", "name");</pre>
  ///
  /// untuk menghapus data yang merupakan Nested Data, maka dapat memasukan
  /// key nya dari level 1 sampai ke level data yang dituju dan dipisahkan dengan
  /// tanda titik (.)
  /// <pre>HiveBox.delete("user", "social_media.instagram");</pre>
  ///
  /// Saat ini level nested yang didukung hanya sampai level 5.
  static Future<void> delete(Box box, String key) async {
    
    if (!key.contains(".")) {
      print("object");
      await box.delete(key);
    } else if (key.contains(".")) {
      List keyList = key.split(".").toList();
      if (keyList.length > 1) {
        await _deepDelete(box, keyList);
      } else {
        print("Failed to update data");
      }
    }
  }

  static Future<void> _deepDelete(Box box, List key) async {
    var root = await box.get(key[0]) as Map;

    switch (key.length) {
      case 2:
        root.remove(key);
        break;
      case 3:
        root[key[2]].remove(key);
        break;
      case 4:
        root[key[2]][key[3]].remove(key);
        break;
      case 5:
        root[key[2]][key[3]][key[4]].remove(key);
        break;
      default:
        break;
    }

    await box.put(key[0], root);
  }

  /// menghapus semua entry di dalam box
  ///
  /// [eager] = [true], maka akan menghapus semua entry yang ada
  ///
  /// [eager] = [false], maka akan menghapus semua entry
  /// kecuali id box (diawali dengan garis bawah (_))
  /// dan yang didaftarkan pada except (jika ada).
  static Future<void> clear(
    Box box, {
    bool eager = true,
    List except = const [],
  }) async {
    List keyList = box.keys.toList();

    if (eager == false) {
      keyList.removeWhere((element) => element.toString().startsWith("_"));
      keyList.removeWhere((element) => except.contains(element));
    }

    box.deleteAll(keyList);
  }
}
