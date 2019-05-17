import 'package:json_annotation/json_annotation.dart';

part 'hazard_model.g.dart';

@JsonSerializable()
class HazardModel extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<Data> data;

  HazardModel(
    this.code,
    this.msg,
    this.data,
  );

  factory HazardModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HazardModelFromJson(srcJson);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'dangerRemark')
  String dangerRemark;

  @JsonKey(name: 'dangerAddress')
  String dangerAddress;

  @JsonKey(name: 'dangerType')
  String dangerType;

  @JsonKey(name: 'todoType')
  String todoType;

  @JsonKey(name: 'equipmentCode')
  String equipmentCode;

  @JsonKey(name: 'dangerLevel')
  String dangerLevel;

  @JsonKey(name: 'equipmentName')
  String equipmentName;

  Data(
    this.dangerRemark,
    this.dangerAddress,
    this.dangerType,
    this.todoType,
    this.equipmentCode,
    this.dangerLevel,
    this.equipmentName,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);
}
