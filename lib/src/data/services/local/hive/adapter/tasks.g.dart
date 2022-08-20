// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasksAdapter extends TypeAdapter<Tasks> {
  @override
  final int typeId = 4;

  @override
  Tasks read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tasks(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String?,
      category: fields[3] as Category?,
      tags: (fields[4] as List?)?.cast<Tags>(),
      time: fields[5] as String,
      priority: fields[6] as int?,
      active: fields[7] as bool?,
      repeat: fields[8] as Repeat,
      createdAt: fields[9] as DateTime,
      updatedAt: fields[10] as dynamic,
      startedAt: fields[11] as dynamic,
      endedAt: fields[12] as DateTime?,
      content: fields[13] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Tasks obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.tags)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.priority)
      ..writeByte(7)
      ..write(obj.active)
      ..writeByte(8)
      ..write(obj.repeat)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.startedAt)
      ..writeByte(12)
      ..write(obj.endedAt)
      ..writeByte(13)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
