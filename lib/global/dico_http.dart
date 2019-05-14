import 'package:dio/dio.dart';
import 'package:inspection/entity/home_model.dart';
import 'package:inspection/entity/login_model.dart';
import 'package:inspection/global/http_util.dart';
import 'package:inspection/global/sharedpreferences.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class DicoHttpRepository {
  static final String login = 'dico-system/auth/login';
  static final String home = 'sms-interface/home/index';
  static final String hazard = 'sms-interface/danger/dangerReport';

  /**
   * 登录
   */
  static Future<LoginModel> userLogin(
      {String username, String password}) async {
    Options options = Options(headers: {'user-agent': 'android'});
    Map data = {'username': username, 'password': password};
    Map map = await HttpUtil().post(login, data: data, options: options);
    return LoginModel.fromJson(map);
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
      {List<Asset> assets, Map<String, String> map}) async {
    return await HttpUtil()
        .onMultipartRequest(assets: assets, map: map, url: hazard);
  }
}
