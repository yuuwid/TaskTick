import 'package:hive/hive.dart';
import 'tags.dart';
import 'category.dart';
import 'repeat.dart';

part 'tasks.g.dart';

@HiveType(typeId: 4)
class Tasks {
  @HiveField(0)
  late String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  Category? category;

  @HiveField(4)
  List<Tags>? tags = [];

  @HiveField(5)
  String time;

  @HiveField(6)
  int? priority;

  @HiveField(7)
  bool? active;

  @HiveField(8)
  Repeat repeat;

  @HiveField(9)
  DateTime createdAt;

  @HiveField(10)
  DateTime? updatedAt;

  @HiveField(11)
  DateTime? startedAt;

  @HiveField(12)
  DateTime? endedAt;

  @HiveField(13)
  String? content;

  Tasks({
    required this.id,
    required this.title,
    this.description,
    this.category,
    this.tags,
    required this.time,
    this.priority = 1,
    this.active = true,
    required this.repeat,
    required this.createdAt,
    updatedAt,
    startedAt,
    this.endedAt,
    this.content,
  }) {
    this.updatedAt = updatedAt ?? createdAt;
    this.startedAt =
        startedAt ?? DateTime(createdAt.year, createdAt.month, createdAt.day);
  }

  static Tasks toObj(Map map) {
    return Tasks(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      category: (map['category'] != null) ? map['category'] : null,
      time: map['time'],
      priority: map['priority'],
      active: map['active'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      startedAt: map['startedAt'],
      repeat: map['repeat'],
      endedAt: map['endedAt'],
      content: map['content'],
    );
  }

  Map toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': (category != null) ? category : null,
      'time': time,
      'priority': priority,
      'active': active,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'startedAt': startedAt,
      'repeat': repeat,
      'endedAt': endedAt,
      'content': content,
    };
  }
}
