// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repeat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RepeatAdapter extends TypeAdapter<Repeat> {
  @override
  final int typeId = 16;

  @override
  Repeat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Repeat(
      id: fields[0] as String,
      title: fields[1] as String,
      reminderInterval: fields[2] as int,
      except: (fields[3] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, Repeat obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.reminderInterval)
      ..writeByte(3)
      ..write(obj.except);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RepeatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
