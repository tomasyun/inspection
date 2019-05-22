import 'package:dio/dio.dart';
import 'package:inspection/entity/filter_model.dart';
import 'package:inspection/entity/hazard_info_model.dart';
import 'package:inspection/entity/hazard_model.dart';
import 'package:inspection/entity/home_model.dart';
import 'package:inspection/entity/keep_record_model.dart';
import 'package:inspection/entity/login_model.dart';
import 'package:inspection/entity/notice_model.dart';
import 'package:inspection/entity/recheck_info_model.dart';
import 'package:inspection/entity/rectify_form_model.dart';
import 'package:inspection/entity/rectify_info_model.dart';
import 'package:inspection/entity/repair_record_model.dart';
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
  static final String repairReport = 'sms-interface/equipment/saveRepairInfo';
  static final String warningRecord = '';
  static final String repairRecord = 'sms-interface/equipment/findRepairList';
  static final String keepRecord = 'sms-interface/equipment/findMaintainList';
  static final String hazardInfo = 'sms-interface/danger/findDnagerInfo';
  static final String rectifyInfo = 'sms-interface/danger/getRectifyInfo';
  static final String rectifyReport =
      'sms-interface/danger/saveDangerRepairInfo';
  static final String rectifyForm = 'sms-interface/danger/getRepairForSave';
  static final String recheckInfo = 'sms-interface/danger/getReviewInfo';
  static final String recheckForm = 'sms-interface/danger/getReviewForSave';
  static final String recheckReport =
      'sms-interface/danger/saveDangerReviewInfo';
  static final String userInfo = 'sms-interface/todos/getCurrentUserInfo';
  static final String todos = 'sms-interface/todos/findToDoList';
  static final String updatePassword = 'sms-interface/todos/updatePass';
  static final String notice = 'sms-interface/message/findMessageList';
  static final String deleteNotice = 'sms-interface/message/deleteMessage';
  static final String inspectPlan = '';
  static final String minePlan = '';
  static final String aboutPlan = '';
  static final String depart =
      'sms-interface/organization/findOrganizationList';
  static final String pic =
      'sms-interface/organization/findSysUserByOrganizationId';
  static final String repairMan = 'sms-interface/organization/findSysUserAll';

  static final String historyHazard =
      'sms-interface/danger/findDnagerFinishList';

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

  static Future<HazardModel> doGetHistoryHazardRequest() async =>
      HazardModel.fromJson(await HttpUtil().get(historyHazard));

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

  ///获取责任部门
  static Future<FilterModel> doGetDepartsRequest() async =>
      FilterModel.fromJson(await HttpUtil().get(depart));

  ///获取责任人
  static Future<FilterModel> doGetPicRequest(String departId) async =>
      FilterModel.fromJson(
          await HttpUtil().get(pic + '?organizationId=$departId'));

  ///获取维修人
  static Future<FilterModel> doGetRepairManRequest() async =>
      FilterModel.fromJson(await HttpUtil().get(repairMan));

  ///设备扫码
  static Future scanQRCodeRequest(String url) async {
    return await HttpUtil().get(url);
  }

  ///复查信息
  static Future<RecheckInfoModel> doGetRecheckInfoRequest(
          String hazardId) async =>
      RecheckInfoModel.fromJson(
          await HttpUtil().get(recheckInfo + '?dangerId=$hazardId'));

  ///维修上报
  static Future<Map<String, dynamic>> repairReportRequest(
      Map<String, String> map) async {
    return await HttpUtil().post(repairReport, data: map);
  }

  ///设备预警
  static Future doGetDeviceWarningRequest() async {
    return await HttpUtil().get(warningRecord);
  }

  ///维修记录
  static Future<RepairRecordModel> doGetRepairRecordRequest(
      String equipmentId) async {
    return RepairRecordModel.fromJson(
        await HttpUtil().get(repairRecord + '?equipmentId=$equipmentId'));
  }

  ///保养记录
  static Future<KeepRecordModel> doGetKeepRecordRequest(
      String equipmentId) async {
    return KeepRecordModel.fromJson(
        await HttpUtil().get(keepRecord + '?equipmentId=$equipmentId'));
  }

  ///整改上报
  static Future<Map<String, dynamic>> doSendRectifyReport(
          FormData data) async =>
      await HttpUtil().post(rectifyReport, data: data);

  ///获取整改单信息
  static Future<RectifyFormModel> doGetRectifyFormRequest(
          String dangerId) async =>
      RectifyFormModel.fromJson(
          await HttpUtil().get(rectifyForm + '?dangerId=$dangerId'));

  ///获取复查单信息
  static Future<Map<String, dynamic>> doGetRecheckFormRequest(
          String dangerId) async =>
      await HttpUtil().get(recheckForm + '?dangerId=$dangerId');

  ///复查上报
  static Future<Map<String, dynamic>> doSendRecheckReport(
          FormData data) async =>
      await HttpUtil().post(recheckReport, data: data);

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
