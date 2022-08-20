import 'package:hive/hive.dart';

part 'repeat.g.dart';

@HiveType(typeId: 16)
class Repeat {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  int reminderInterval;

  @HiveField(3)
  List<int> except;

  Repeat({
    required this.id,
    required this.title,
    this.reminderInterval = 0,
    this.except = const [],
  });

  static Repeat toObj(Map map) {
    return Repeat(
      id: map['id'],
      title: map['title'],
      reminderInterval: map['reminderInterval'] ,
      except: map['except'] ,
    );
  }

  Map toMap() {
    return {
      'id': id,
      'title': title,
      'reminderInterval': reminderInterval,
      'except': except,
    };
  }
}
