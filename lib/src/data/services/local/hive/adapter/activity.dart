import 'package:hive/hive.dart';

part 'activity.g.dart';

@HiveType(typeId: 87)
class Activity {
  @HiveField(0)
  String id;

  @HiveField(1)
  String taskId;

  @HiveField(2)
  int status;

  @HiveField(3)
  DateTime createdAt;

  @HiveField(4)
  int? sleep;

  @HiveField(5)
  DateTime? doneAt;

  Activity({
    required this.id,
    required this.taskId,
    this.status = 0,
    required this.createdAt,
    this.sleep,
    this.doneAt,
  });

  static Activity toObj(Map map) {
    return Activity(
      id: map['id'],
      taskId: map['taskId'],
      status: map['status'],
      createdAt: map['createdAt'],
      sleep: map['sleep'],
      doneAt: map['doneAt'],
    );
  }

  Map toMap() {
    return {
      'id': id,
      'taskId': taskId,
      'status': status,
      'createdAt': createdAt,
      'sleep': sleep,
      'doneAt': doneAt,
    };
  }
}
