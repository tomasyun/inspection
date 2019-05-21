import 'package:dio/dio.dart';
import 'package:inspection/entity/filter_model.dart';
import 'package:inspection/entity/hazard_info_model.dart';
import 'package:inspection/entity/hazard_model.dart';
import 'package:inspection/entity/home_model.dart';
import 'package:inspection/entity/login_model.dart';
import 'package:inspection/entity/notice_model.dart';
import 'package:inspection/entity/rectify_info_model.dart';
import 'package:inspection/entity/task_model.dart';
import 'package:inspection/entity/user_model.dart';
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
  static final String keepRecord = '';
  static final String hazardInfo = 'sms-interface/danger/findDnagerInfo';
  static final String rectifyInfo = 'sms-interface/danger/getRectifyInfo';
  static final String rectifyReport = '';
  static final String recheckInfo = '';
  static final String recheckReport = '';
  static final String userInfo = 'sms-interface/todos/getCurrentUserInfo';
  static final String todos = 'sms-interface/todos/findToDoList';
  static final String updatePassword = 'sms-interface/todos/updatePass';
  static final String notice = 'sms-interface/message/findMessageList';
  static final String deleteNotice = 'sms-interface/message/deleteMessage';
  static final String inspectPlan = '';
  static final String minePlan = '';
  static final String aboutPlan = '';

  ///登录
  static Future<LoginModel> userLogin(Map<String, String> map) async =>
      LoginModel.fromJson(await HttpUtil().post(login, data: map));

  ///首页
  static Future<HomeModel> homeRequest() async =>
      HomeModel.fromJson(await HttpUtil().get(home));

  /// 隐患上报
  static Future<Map<String, dynamic>> hazardReportRequest(
          FormData data) async =>
      await HttpUtil().post(hazardReport, data: data);

  ///获取隐患等级
  static Future<FilterModel> doGetHazardLevelRequest() async =>
      FilterModel.fromJson(await HttpUtil().get(hazardLevel));

  ///获取隐患类型
  static Future<FilterModel> doGetHazardTypeRequest() async =>
      FilterModel.fromJson(await HttpUtil().get(hazardType));

  ///隐患管理
  static Future<HazardModel> doGetHazardManageRequest(String research) async =>
      HazardModel.fromJson(await HttpUtil().get(hazardManage + research));

  ///隐患信息
  static Future<HazardInfoModel> doGetHazardInfoRequest(
          String hazardId) async =>
      HazardInfoModel.fromJson(
          await HttpUtil().get(hazardInfo + '?dangerId=$hazardId'));

  ///整改费用申请(废弃)

  ///整改信息
  static Future<RectifyInfoModel> doGetRectifyInfoRequest(
          String hazardId) async =>
      RectifyInfoModel.fromJson(
          await HttpUtil().get(rectifyInfo + '?dangerId=$hazardId'));

  ///个人信息
  static Future<UserModel> doGetUserInfoRequest() async =>
      UserModel.fromJson(await HttpUtil().get(userInfo));

  ///密码修改
  static Future<Map<String, dynamic>> doUpdatePasswordRequest(
          FormData data) async =>
      await HttpUtil().post(updatePassword, data: data);

  ///代办任务
  static Future<TaskModel> doGetTodosRequest() async =>
      TaskModel.fromJson(await HttpUtil().get(todos));

  ///通知消息
  static Future<NoticeModel> doGetNotice() async =>
      NoticeModel.fromJson(await HttpUtil().get(notice));

  /// 删除通知消息
  static Future<Map<String, dynamic>> doDeleteNoticeRequest(
          String noticeId) async =>
      await HttpUtil().delete(deleteNotice + '?messageId=$noticeId');

  ///设备扫码
  static Future scanQRCodeRequest(String url) async {
    return await HttpUtil().get(url);
  }

  ///复查信息
  static Future doGetRecheckInfoRequest(String hazardId) async {
    return await HttpUtil().get(recheckInfo);
  }

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
  static Future doGetKeepRecordRequest() async {
    return await HttpUtil().get(keepRecord);
  }

  ///整改上报
  static Future doRectifyReport() async {
    return await HttpUtil().get(rectifyReport);
  }

  ///复查上报
  static Future doRecheckReport() async {
    return await HttpUtil().get(recheckReport);
  }

  ///检查计划
  static Future doInspectPlanRequest() async {
    return await HttpUtil().get(inspectPlan);
  }

  ///我的计划
  static Future doMinePlanRequest() async {
    return await HttpUtil().get(minePlan);
  }

  ///关于计划
  static Future doAboutPlanRequest() async {
    return await HttpUtil().get(aboutPlan);
  }
}
