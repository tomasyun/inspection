class UserModel {
  int code;
  String msg;
  Data data;

  UserModel({
    this.code,
    this.msg,
    this.data,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
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
  String organization;
  String name;
  String company;
  String userName;

  Data({
    this.organization,
    this.name,
    this.company,
    this.userName,
  });

  Data.fromJson(Map<String, dynamic> json) {
    organization = json['organization'];
    name = json['name'];
    company = json['company'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organization'] = this.organization;
    data['name'] = this.name;
    data['company'] = this.company;
    data['userName'] = this.userName;
    return data;
  }
}
