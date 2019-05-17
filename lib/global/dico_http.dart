import 'dart:convert' show json;

import 'package:dio/dio.dart';
import 'package:inspection/entity/filter_model.dart';
import 'package:inspection/entity/hazard_model.dart';
import 'package:inspection/entity/home_model.dart';
import 'package:inspection/entity/login_model.dart';
import 'package:inspection/global/http_util.dart';

class DicoHttpRepository {
  static final String login = 'dico-system/auth/login';
  static final String home = 'sms-interface/home/index';
  static final String hazardReport = 'sms-interface/danger/dangerReport';
  static final String hazardLevel = 'sms-interface/danger/findDangerLevel';
  static final String hazardType = 'sms-interface/danger/findDangerType';
  static final String hazardManage = 'sms-interface/danger/findDnagerList';
  static final String repairReport = '';
  static final String warningRecord = '';
  static final String repairRecord = '';

  ///设备扫码

  static Future scanQRCodeRequest(String url) async {
    return await HttpUtil().get(url);
  }

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
  static Future<FilterModel> doGetHazardLevelRequest() async =>
      FilterModel.fromJson(await HttpUtil().get(hazardLevel));

  ///获取隐患类型
  static Future<FilterModel> doGetHazardTypeRequest() async =>
      FilterModel.fromJson(await HttpUtil().get(hazardType));

  ///维修上报
  static Future repairReportRequest(Map<String, String> map) async {
    return await HttpUtil().post(repairReport, data: map);
  }

  ///设备预警
  static Future doGetDeviceWarningRequest() async {
    return await HttpUtil().get(warningRecord);
  }

  ///维修记录

  static Future doGetRepairRecordRequest() async {
    return await HttpUtil().get(repairRecord);
  }

  ///保养记录

  ///隐患管理

  static Future<HazardModel> doGetHazardManageRequest(String research) async {
    return HazardModel.fromJson(await HttpUtil().get(hazardManage + research));
  }

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

  /// 删除通知消息

  ///检查计划

  ///我的计划

  ///关于计划
}
