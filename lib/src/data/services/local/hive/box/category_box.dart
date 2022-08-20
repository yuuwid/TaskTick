// ignore_for_file: unused_field, unused_element

import 'package:hive/hive.dart';
import 'package:tasktick/src/app/extension/hive/hive_box.dart';
import '../adapter/category.dart';

class CategoryBox {
  static final String _boxName = "category-box";

  static late Box _box;

  static Future<void> init() async {
    _box = await HiveBox.open(_boxName);

    if (_box.isEmpty) {
      await _initialData();
    }
  }

  static Future<void> add(Category category) async {
    String id = category.id;

    if (!_box.containsKey(id)) {
      await _box.put(id, category);
    }
  }

  static Future<void> update(String id, String key, dynamic value) async {
    if (find(id) != null) {
      Map category = find(id)!.toMap();
      category[key] = value;
      await _box.put(id, Category.toObj(category));
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

  static Category? find(dynamic id) {
    if (read().containsKey(id)) {
      return read()[id];
    } else {
      return null;
    }
  }

  static List<Category> where(dynamic key, dynamic value, {bool like = false}) {
    List<Category> result = [];
    read().forEach((k, v) {
      v as Category;
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
      'my-category': Category(
        id: 'my-category',
        title: "Schedule",
        icon: 0xf096a,
        isPermanent: true,
        createdAt: DateTime.now(),
      ),
    };
    await _box.putAll(data);
  }
}
