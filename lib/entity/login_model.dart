class LoginModel {
  /**
   * {
      "code": 0,
      "msg": "登录成功",
      "data": {
      "name": "系统管理员",
      "icon": "",
      "company": "陕西缔科网络科技有限公司",
      "token": "eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJkaWNvLXN5c3RlbSIsInN1YiI6IjEiLCJhdWQiOiJtb2JpbGUiLCJpYXQiOjE1NTczODE5OTMsImV4cCI6MTU1NzQ0MTk5M30.oqx9DZ9i8LPFtp1DeLw-bKftJCzh1s2ljba0xu_-4jvTxdUmJK_-iIugsd1GU4wSujC05bov759yYX5QTh0J1Q"
      }
      }
   */

  int code;
  String msg;
  Data data;

  LoginModel({this.code, this.msg, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String name;
  String icon;
  String company;
  String token;

  Data({this.name, this.icon, this.company, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    company = json['company'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['company'] = this.company;
    data['token'] = this.token;
    return data;
  }
}
