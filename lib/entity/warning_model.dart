class WarningModel {
  int code;
  String msg;
  List<Data> data;

  WarningModel({this.code, this.msg, this.data});

  WarningModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String organization;
  String equipmentCode;
  String equipmentName;
  String person;
  String warningLevel;
  int days;

  Data(
      {this.organization,
      this.equipmentCode,
      this.equipmentName,
      this.person,
      this.warningLevel,
      this.days});

  Data.fromJson(Map<String, dynamic> json) {
    organization = json['organization'];
    equipmentCode = json['equipmentCode'];
    equipmentName = json['equipmentName'];
    person = json['person'];
    warningLevel = json['warningLevel'];
    days = json['days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organization'] = this.organization;
    data['equipmentCode'] = this.equipmentCode;
    data['equipmentName'] = this.equipmentName;
    data['person'] = this.person;
    data['warningLevel'] = this.warningLevel;
    data['days'] = this.days;
    return data;
  }
}
