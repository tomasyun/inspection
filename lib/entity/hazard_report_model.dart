import 'package:json_annotation/json_annotation.dart';

part 'hazard_report_model.g.dart';

@JsonSerializable()
class HazardReportModel extends Object {
  @JsonKey(name: 'dangerAddress')
  String dangerAddress;

  @JsonKey(name: 'equipmentId')
  String equipmentId;

  @JsonKey(name: 'equipmentName')
  String equipmentName;

  @JsonKey(name: 'dangerLevelId')
  String dangerLevelId;

  @JsonKey(name: 'dangerLevelName')
  String dangerLevelName;

  @JsonKey(name: 'dangerTypeId')
  String dangerTypeId;

  @JsonKey(name: 'dangerTypeName')
  String dangerTypeName;

  @JsonKey(name: 'dangerRemark')
  String dangerRemark;

  HazardReportModel(
    this.dangerAddress,
    this.equipmentId,
    this.equipmentName,
    this.dangerLevelId,
    this.dangerLevelName,
    this.dangerTypeId,
    this.dangerTypeName,
    this.dangerRemark,
  );

  factory HazardReportModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HazardReportModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HazardReportModelToJson(this);
}
