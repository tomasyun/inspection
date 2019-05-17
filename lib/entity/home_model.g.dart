// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return HomeModel(
      json['code'] as int,
      json['msg'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      (json['banner'] as List)
          ?.map((e) =>
              e == null ? null : Banner.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['todos'] == null
          ? null
          : Todos.fromJson(json['todos'] as Map<String, dynamic>),
      json['notice'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'banner': instance.banner,
      'todos': instance.todos,
      'notice': instance.notice
    };

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner(json['title'] as String, json['url'] as String);
}

Map<String, dynamic> _$BannerToJson(Banner instance) =>
    <String, dynamic>{'title': instance.title, 'url': instance.url};

Todos _$TodosFromJson(Map<String, dynamic> json) {
  return Todos(
      json['rectify'] == null
          ? null
          : Rectify.fromJson(json['rectify'] as Map<String, dynamic>),
      json['review'] == null
          ? null
          : Review.fromJson(json['review'] as Map<String, dynamic>),
      json['inspect'] == null
          ? null
          : Inspect.fromJson(json['inspect'] as Map<String, dynamic>));
}

Map<String, dynamic> _$TodosToJson(Todos instance) => <String, dynamic>{
      'rectify': instance.rectify,
      'review': instance.review,
      'inspect': instance.inspect
    };

Rectify _$RectifyFromJson(Map<String, dynamic> json) {
  return Rectify(
      json['dangerRemark'] as String,
      json['dangerAddress'] as String,
      json['dangerType'] as String,
      json['todoType'] as String,
      json['equipmentCode'] as String,
      json['dangerLevel'] as String,
      json['equipmentName'] as String);
}

Map<String, dynamic> _$RectifyToJson(Rectify instance) => <String, dynamic>{
      'dangerRemark': instance.dangerRemark,
      'dangerAddress': instance.dangerAddress,
      'dangerType': instance.dangerType,
      'todoType': instance.todoType,
      'equipmentCode': instance.equipmentCode,
      'dangerLevel': instance.dangerLevel,
      'equipmentName': instance.equipmentName
    };

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return Review(
      json['dangerRemark'] as String,
      json['dangerAddress'] as String,
      json['dangerType'] as String,
      json['todoType'] as String,
      json['equipmentCode'] as String,
      json['dangerLevel'] as String,
      json['equipmentName'] as String);
}

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'dangerRemark': instance.dangerRemark,
      'dangerAddress': instance.dangerAddress,
      'dangerType': instance.dangerType,
      'todoType': instance.todoType,
      'equipmentCode': instance.equipmentCode,
      'dangerLevel': instance.dangerLevel,
      'equipmentName': instance.equipmentName
    };

Inspect _$InspectFromJson(Map<String, dynamic> json) {
  return Inspect(
      json['installArea'] as String,
      json['equipmentCode'] as String,
      json['equipmentName'] as String,
      json['equipmentType'] as String,
      json['status'] as int);
}

Map<String, dynamic> _$InspectToJson(Inspect instance) => <String, dynamic>{
      'installArea': instance.installArea,
      'equipmentCode': instance.equipmentCode,
      'equipmentName': instance.equipmentName,
      'equipmentType': instance.equipmentType,
      'status': instance.status
    };
