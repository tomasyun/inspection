// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hazard_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HazardReportModel _$HazardReportModelFromJson(Map<String, dynamic> json) {
  return HazardReportModel(
      json['dangerAddress'] as String,
      json['equipmentId'] as String,
      json['equipmentName'] as String,
      json['dangerLevelId'] as String,
      json['dangerLevelName'] as String,
      json['dangerTypeId'] as String,
      json['dangerTypeName'] as String,
      json['dangerRemark'] as String);
}

Map<String, dynamic> _$HazardReportModelToJson(HazardReportModel instance) =>
    <String, dynamic>{
      'dangerAddress': instance.dangerAddress,
      'equipmentId': instance.equipmentId,
      'equipmentName': instance.equipmentName,
      'dangerLevelId': instance.dangerLevelId,
      'dangerLevelName': instance.dangerLevelName,
      'dangerTypeId': instance.dangerTypeId,
      'dangerTypeName': instance.dangerTypeName,
      'dangerRemark': instance.dangerRemark
    };
