import 'package:json_annotation/json_annotation.dart';

part 'filter_model.g.dart';

@JsonSerializable()
class FilterModel extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<Data> data;

  FilterModel(
    this.code,
    this.msg,
    this.data,
  );

  factory FilterModel.fromJson(Map<String, dynamic> srcJson) =>
      _$FilterModelFromJson(srcJson);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  Data(
    this.name,
    this.id,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);
}
