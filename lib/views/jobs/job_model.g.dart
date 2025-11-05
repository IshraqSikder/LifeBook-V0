// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobItemAdapter extends TypeAdapter<JobItem> {
  @override
  final int typeId = 5;

  @override
  JobItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobItem(
      imageUrl: fields[0] as String,
      title: fields[1] as String,
      subtitle: fields[2] as String,
      description: fields[3] as String,
      salary: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, JobItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.imageUrl)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.salary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
