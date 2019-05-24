class PlanAboutModel {
  int code;
  String msg;
  List<Data> data;

  PlanAboutModel({this.code, this.msg, this.data});

  PlanAboutModel.fromJson(Map<String, dynamic> json) {
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
  String inspectionStatus;
  String equipmentCode;
  String equipmentAddress;
  String equipmentClass;
  String equipmentName;
  String equipmentId;
  String planId;

  Data(
      {this.inspectionStatus,
      this.equipmentCode,
      this.equipmentAddress,
      this.equipmentClass,
      this.equipmentName,
      this.equipmentId,
      this.planId});

  Data.fromJson(Map<String, dynamic> json) {
    inspectionStatus = json['inspectionStatus'];
    equipmentCode = json['equipmentCode'];
    equipmentAddress = json['equipmentAddress'];
    equipmentClass = json['equipmentClass'];
    equipmentName = json['equipmentName'];
    equipmentId = json['equipmentId'];
    planId = json['planId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['inspectionStatus'] = this.inspectionStatus;
    data['equipmentCode'] = this.equipmentCode;
    data['equipmentAddress'] = this.equipmentAddress;
    data['equipmentClass'] = this.equipmentClass;
    data['equipmentName'] = this.equipmentName;
    data['equipmentId'] = this.equipmentId;
    data['planId'] = this.planId;
    return data;
  }
}
