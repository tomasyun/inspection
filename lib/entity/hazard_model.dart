class HazardModel {
  int code;
  String msg;
  List<Data> data;

  HazardModel({
    this.code,
    this.msg,
    this.data,
  });

  HazardModel.fromJson(Map<String, dynamic> json) {
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
  String dangerRemark;
  String dangerAddress;
  String dangerType;
  String todoType;
  String equipmentCode;
  String dangerLevel;
  String equipmentName;
  String dangerId;

  Data(
      {this.dangerRemark,
      this.dangerAddress,
      this.dangerType,
      this.todoType,
      this.equipmentCode,
      this.dangerLevel,
      this.equipmentName,
      this.dangerId});

  Data.fromJson(Map<String, dynamic> json) {
    dangerRemark = json['dangerRemark'];
    dangerAddress = json['dangerAddress'];
    dangerType = json['dangerType'];
    todoType = json['todoType'];
    equipmentCode = json['equipmentCode'];
    dangerLevel = json['dangerLevel'];
    equipmentName = json['equipmentName'];
    dangerId = json['dangerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dangerRemark'] = this.dangerRemark;
    data['dangerAddress'] = this.dangerAddress;
    data['dangerType'] = this.dangerType;
    data['todoType'] = this.todoType;
    data['equipmentCode'] = this.equipmentCode;
    data['dangerLevel'] = this.dangerLevel;
    data['equipmentName'] = this.equipmentName;
    data['dangerId'] = this.dangerId;
    return data;
  }
}
