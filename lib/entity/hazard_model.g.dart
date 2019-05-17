// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hazard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HazardModel _$HazardModelFromJson(Map<String, dynamic> json) {
  return HazardModel(
      json['code'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HazardModelToJson(HazardModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['dangerRemark'] as String,
      json['dangerAddress'] as String,
      json['dangerType'] as String,
      json['todoType'] as String,
      json['equipmentCode'] as String,
      json['dangerLevel'] as String,
      json['equipmentName'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'dangerRemark': instance.dangerRemark,
      'dangerAddress': instance.dangerAddress,
      'dangerType': instance.dangerType,
      'todoType': instance.todoType,
      'equipmentCode': instance.equipmentCode,
      'dangerLevel': instance.dangerLevel,
      'equipmentName': instance.equipmentName
    };
