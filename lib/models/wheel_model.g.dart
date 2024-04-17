// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WheelModelAdapter extends TypeAdapter<WheelModel> {
  @override
  final int typeId = 0;

  @override
  WheelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WheelModel(
      question: fields[0] as String,
      options: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, WheelModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.options);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WheelModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
