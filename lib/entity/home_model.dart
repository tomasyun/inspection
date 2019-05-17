import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  Data data;

  HomeModel(
    this.code,
    this.msg,
    this.data,
  );

  factory HomeModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeModelFromJson(srcJson);
}

@JsonSerializable()
class Data extends Object {
  @JsonKey(name: 'banner')
  List<Banner> banner;

  @JsonKey(name: 'todos')
  Todos todos;

  @JsonKey(name: 'notice')
  String notice;

  Data(
    this.banner,
    this.todos,
    this.notice,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);
}

@JsonSerializable()
class Banner extends Object {
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'url')
  String url;

  Banner(
    this.title,
    this.url,
  );

  factory Banner.fromJson(Map<String, dynamic> srcJson) =>
      _$BannerFromJson(srcJson);
}

@JsonSerializable()
class Todos extends Object {
  @JsonKey(name: 'rectify')
  Rectify rectify;

  @JsonKey(name: 'review')
  Review review;

  @JsonKey(name: 'inspect')
  Inspect inspect;

  Todos(
    this.rectify,
    this.review,
    this.inspect,
  );

  factory Todos.fromJson(Map<String, dynamic> srcJson) =>
      _$TodosFromJson(srcJson);
}

@JsonSerializable()
class Rectify extends Object {
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

  Rectify(
    this.dangerRemark,
    this.dangerAddress,
    this.dangerType,
    this.todoType,
    this.equipmentCode,
    this.dangerLevel,
    this.equipmentName,
  );

  factory Rectify.fromJson(Map<String, dynamic> srcJson) =>
      _$RectifyFromJson(srcJson);
}

@JsonSerializable()
class Review extends Object {
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

  Review(
    this.dangerRemark,
    this.dangerAddress,
    this.dangerType,
    this.todoType,
    this.equipmentCode,
    this.dangerLevel,
    this.equipmentName,
  );

  factory Review.fromJson(Map<String, dynamic> srcJson) =>
      _$ReviewFromJson(srcJson);
}

@JsonSerializable()
class Inspect extends Object {
  @JsonKey(name: 'installArea')
  String installArea;

  @JsonKey(name: 'equipmentCode')
  String equipmentCode;

  @JsonKey(name: 'equipmentName')
  String equipmentName;

  @JsonKey(name: 'equipmentType')
  String equipmentType;

  @JsonKey(name: 'status')
  int status;

  Inspect(
    this.installArea,
    this.equipmentCode,
    this.equipmentName,
    this.equipmentType,
    this.status,
  );

  factory Inspect.fromJson(Map<String, dynamic> srcJson) =>
      _$InspectFromJson(srcJson);
}
