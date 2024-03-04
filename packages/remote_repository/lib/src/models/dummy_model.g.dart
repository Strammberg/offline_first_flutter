// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DummyModelAdapter extends TypeAdapter<DummyModel> {
  @override
  final int typeId = 0;

  @override
  DummyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DummyModel(
      id: fields[0] as String?,
      value: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DummyModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DummyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyModel _$DummyModelFromJson(Map<String, dynamic> json) => DummyModel(
      id: json['id'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$DummyModelToJson(DummyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
    };
