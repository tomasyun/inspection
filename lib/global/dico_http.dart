import 'package:inspection/entity/login_model.dart';
import 'package:inspection/global/http_util.dart';

class DicoHttpRepository {
  static final String login = "auth/login";

  /**
   * 登录
   */
  static Future<LoginModel> userLogin(
      {String username, String password}) async {
    Map data = {'username': username, 'password': password};
    Map map = await HttpUtil().post(login, data: data, isLogin: true);
    return LoginModel.fromJson(map);
  }
}
