import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 21)
class Category {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  int? icon;

  @HiveField(3)
  bool? isPermanent = false;

  @HiveField(4)
  DateTime? createdAt = DateTime.now();

  Category({
    required this.id,
    required this.title,
    this.icon,
    this.isPermanent,
    this.createdAt,
  });

  static Category toObj(Map map) {
    return Category(
      id: map['id'],
      title: map['title'],
      icon: map['icon'],
      isPermanent: map['isPermanent'],
      createdAt: map['createdAt'],
    );
  }

  Map toMap() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'isPermanent': isPermanent,
      'createdAt': createdAt,
    };
  }
}
