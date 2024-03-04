import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'dummy_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class DummyModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? value;

  DummyModel({
    this.id,
    this.value,
  });

  factory DummyModel.fromJson(Map<String, dynamic> json) => _$DummyModelFromJson(json);
  Map<String, dynamic> toJson() => _$DummyModelToJson(this);
}