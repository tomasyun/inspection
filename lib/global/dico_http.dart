import 'package:dio/dio.dart';
import 'package:inspection/entity/home_model.dart';
import 'package:inspection/entity/level_model.dart';
import 'package:inspection/entity/login_model.dart';
import 'package:inspection/entity/type_model.dart';
import 'package:inspection/global/http_util.dart';
import 'package:inspection/global/sharedpreferences.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class DicoHttpRepository {
  static final String login = 'dico-system/auth/login';
  static final String home = 'sms-interface/home/index';
  static final String hazard = 'sms-interface/danger/dangerReport';
  static final String hazardLevel = 'sms-interface/danger/findDangerLevel';
  static final String hazardType = 'sms-interface/danger/findDangerType';

  /**
   * 登录
   */
  static Future<LoginModel> userLogin(
      {String username, String password}) async {
    Response response;
    Options options = Options(headers: {'user-agent': 'android'});
    Map data = {'username': username, 'password': password};
    response = await Dio().post('http://192.168.10.19:8080/' + login,
        options: options, data: data);
//    Map map = await HttpUtil().post(login, data: data, options: options);
    return LoginModel.fromJson(response.data);
  }

  /**
   * 首页
   */

  static Future<HomeModel> homeRequest() async {
    String token;
    await SpUtils().getString('token').then((value) {
      token = value;
    });
    Options options =
        Options(headers: {'Authorization': token, 'user-agent': 'android'});
    Map map = await HttpUtil().get(home, options: options);
    return HomeModel.fromJson(map);
  }

  /**
   * 隐患上报
   */
  static Future hazardReportRequest(
      {List<Asset> assets, Map<String, dynamic> map}) async {
    return await HttpUtil()
        .onMultipartRequest(assets: assets, map: map, url: hazard);
  }
/**
 * 获取隐患等级
 */

  static Future<LevelModel> doGetHazardLevelRequest() async {
    String token;
    await SpUtils().getString('token').then((value) {
      token = value;
    });
    Options options =
        Options(headers: {'Authorization': token, 'user-agent': 'android'});
    Map map = await HttpUtil().get(hazardLevel, options: options);
    return LevelModel.fromJson(map);
  }

/**
 * 获取隐患类型
 */
  static Future<TypeModel> doGetHazardTypeRequest() async {
    String token;
    await SpUtils().getString('token').then((value) {
      token = value;
    });
    Options options =
        Options(headers: {'Authorization': token, 'user-agent': 'android'});
    Map map = await HttpUtil().get(hazardType, options: options);
    return TypeModel.fromJson(map);
  }
/**
 * 维修上报
 */

/**
 * 设备预警
 */

/**
 * 维修记录
 */

/**
 * 保养记录
 */

/**
 * 隐患管理
 */

/**
 * 隐患信息
 */

/**
 * 整改上报
 */

/**
 * 整改费用申请
 */

/**
 * 整改信息
 */

/**
 * 复查信息
 */

/**
 * 复查上报
 */

/**
 * 个人信息
 */

/**
 * 密码修改
 */

/**
 * 代办任务
 */

/**
 * 通知消息
 */

/**
 * 检查计划
 */

/**
 * 我的计划
 */

/**
 * 关于计划
 */
}
