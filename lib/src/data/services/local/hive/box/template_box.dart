// // ignore_for_file: unused_field, unused_element

// import 'package:hive/hive.dart';
// import 'package:testing/box/local_box.dart';

// class TemplateBox {
//   static final String _boxName = "template-box";

//   static late Box _box;

//   static Future<void> init() async {
//     _box = await LocalBox.init(_boxName);

//     if (_box.isEmpty) {
//       await _initialData();
//     }
//   }

//   static Future<void> add(Template tasks) async {
//     String id = tasks.id;

//     if (!_box.containsKey(id)) {
//       await _box.put(id, tasks);
//     }
//   }

//   static Future<void> update(String id, String key, dynamic value) async {
//     Map tasks = find(id).toMap();
//     tasks[key] = value;
//     tasks['updatedAt'] = DateTime.now();
//     await _box.put(id, Template.toObj(tasks));
//   }

//   static Future<void> delete(String id) async {
//     await _box.delete(id);
//   }

//   static Future<void> clear() async {
//     await _box.clear();
//   }

//   static Map read() {
//     return _box.toMap();
//   }

//   static Template find(dynamic id) {
//     return read()[id];
//   }

//   static List<Template> where(dynamic key, dynamic value, {bool like = false}) {
//     List<Template> result = [];
//     read().forEach((k, v) {
//       v as Template;
//       var vMap = v.toMap()[key];
//       if (like == false) {
//         if (vMap == value) {
//           result.add(v);
//         }
//       } else {
//         String temp = vMap.toString();
//         if (temp.contains(value.toString())) {
//           result.add(v);
//         }
//       }
//     });
//     return result;
//   }

//   static Future<void> _initialData() async {
//     Map data = {};
//     await _box.putAll(data);
//   }
// }
