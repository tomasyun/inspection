import 'dart:convert' show json;

import 'package:dio/dio.dart';
import 'package:inspection/entity/home_model.dart';
import 'package:inspection/entity/level_model.dart';
import 'package:inspection/entity/login_model.dart';
import 'package:inspection/entity/type_model.dart';
import 'package:inspection/global/http_util.dart';

class DicoHttpRepository {
  static final String login = 'dico-system/auth/login';
  static final String home = 'sms-interface/home/index';
  static final String hazardReport = 'sms-interface/danger/dangerReport';
  static final String hazardLevel = 'sms-interface/danger/findDangerLevel';
  static final String hazardType = 'sms-interface/danger/findDangerType';

  ///登录
  static Future<LoginModel> userLogin(Map<String, String> map) async =>
      LoginModel.fromJson(await HttpUtil().post(login, data: map));

  ///首页
  static Future<HomeModel> homeRequest() async =>
      HomeModel.fromJson(await HttpUtil().get(home));

  /// 隐患上报
  static Future hazardReportRequest(
          List<UploadFileInfo> files, Map<String, String> map) async =>
      await HttpUtil().post(hazardReport,
          data: FormData.from(
              {'smsDangerInfo': json.encode(map), 'files': files}));

  ///获取隐患等级
  static Future<LevelModel> doGetHazardLevelRequest() async =>
      LevelModel.fromJson(await HttpUtil().get(hazardLevel));

  ///获取隐患类型
  static Future<TypeModel> doGetHazardTypeRequest() async =>
      TypeModel.fromJson(await HttpUtil().get(hazardType));

  ///维修上报

  ///设备预警

  ///维修记录

  ///保养记录

  ///隐患管理

  ///隐患信息

  ///整改上报

  ///整改费用申请

  ///整改信息

  ///复查信息

  ///复查上报

  ///个人信息

  ///密码修改

  ///代办任务

  ///通知消息

  ///检查计划

  ///我的计划

  ///关于计划
}
