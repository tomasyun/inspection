class PlanModel {
  int code;
  String msg;
  List<Data> data;

  PlanModel({this.code, this.msg, this.data});

  PlanModel.fromJson(Map<String, dynamic> json) {
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
  String beginDate;
  String planOrganization;
  String endDate;
  String planPerson;
  String planName;
  String planStatus;
  String planId;
  String planCode;

  Data(
      {this.beginDate,
      this.planOrganization,
      this.endDate,
      this.planPerson,
      this.planName,
      this.planStatus,
        this.planId,
      this.planCode});

  Data.fromJson(Map<String, dynamic> json) {
    beginDate = json['beginDate'];
    planOrganization = json['planOrganization'];
    endDate = json['endDate'];
    planPerson = json['planPerson'];
    planName = json['planName'];
    planStatus = json['planStatus'];
    planId = json['planId'];
    planCode = json['planCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beginDate'] = this.beginDate;
    data['planOrganization'] = this.planOrganization;
    data['endDate'] = this.endDate;
    data['planPerson'] = this.planPerson;
    data['planName'] = this.planName;
    data['planStatus'] = this.planStatus;
    data['planId'] = this.planId;
    data['planCode'] = this.planCode;
    return data;
  }
}
