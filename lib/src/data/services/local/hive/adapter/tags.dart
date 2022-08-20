import 'package:hive/hive.dart';

part 'tags.g.dart';

@HiveType(typeId: 43)
class Tags {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  Tags({
    required this.id,
    required this.title,
  });

  static Tags toObj(Map map) {
    return Tags(
      id: map['id'],
      title: map['title'],
    );
  }

  Map toMap() {
    return {
      'id': id,
      'title': title,
    };
  }
}
