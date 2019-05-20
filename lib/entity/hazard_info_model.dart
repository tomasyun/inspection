/**
 *{
    "code": 0,
    "msg": "",
    "data": {
    "attachments": [
    {
    "fileName": "c64990ffd2b949fd9157ff1845adc7d1.jpg",
    "fileUrl": "/img/d6afcd23ba764cfa8cda6508298ef213.jpg"
    },
    {
    "fileName": "c64990ffd2b949fd9157ff1845adc7d1.jpg",
    "fileUrl": "/img/789c4e0c4da04c20b013ced2a02278b4.jpg"
    },
    {
    "fileName": "c64990ffd2b949fd9157ff1845adc7d1.jpg",
    "fileUrl": "/img/03e37314a83e409689d19359c69ebb0a.jpg"
    }
    ],
    "liableOrganization": "研发部",
    "equipmentCode": "001",
    "reviewOrganization": "研发部",
    "dangerLevel": "一般隐患",
    "reviewPerson": "系统管理员",
    "liablePerson": "席沛锋",
    "repairOrganization": "研发部",
    "repairPerson": "系统管理员",
    "dangerRemark": "隐患描述",
    "dangerType": "消防隐患",
    "equipmentName": "灭火器001",
    "createDate": "2019-05-14"
    }
    }
 */

class HazardInfoModel {
  int code;
  String msg;
  Data data;

  HazardInfoModel({this.code, this.msg, this.data});

  HazardInfoModel.fromJson(Map<String, dynamic> json) {
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
  List<Attachments> attachments;
  String liableOrganization;
  String equipmentCode;
  String reviewOrganization;
  String dangerLevel;
  String reviewPerson;
  String liablePerson;
  String repairOrganization;
  String repairPerson;
  String dangerRemark;
  String dangerType;
  String equipmentName;
  String createDate;

  Data(
      {this.attachments,
      this.liableOrganization,
      this.equipmentCode,
      this.reviewOrganization,
      this.dangerLevel,
      this.reviewPerson,
      this.liablePerson,
      this.repairOrganization,
      this.repairPerson,
      this.dangerRemark,
      this.dangerType,
      this.equipmentName,
      this.createDate});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['attachments'] != null) {
      attachments = new List<Attachments>();
      json['attachments'].forEach((v) {
        attachments.add(new Attachments.fromJson(v));
      });
    }
    liableOrganization = json['liableOrganization'];
    equipmentCode = json['equipmentCode'];
    reviewOrganization = json['reviewOrganization'];
    dangerLevel = json['dangerLevel'];
    reviewPerson = json['reviewPerson'];
    liablePerson = json['liablePerson'];
    repairOrganization = json['repairOrganization'];
    repairPerson = json['repairPerson'];
    dangerRemark = json['dangerRemark'];
    dangerType = json['dangerType'];
    equipmentName = json['equipmentName'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attachments != null) {
      data['attachments'] = this.attachments.map((v) => v.toJson()).toList();
    }
    data['liableOrganization'] = this.liableOrganization;
    data['equipmentCode'] = this.equipmentCode;
    data['reviewOrganization'] = this.reviewOrganization;
    data['dangerLevel'] = this.dangerLevel;
    data['reviewPerson'] = this.reviewPerson;
    data['liablePerson'] = this.liablePerson;
    data['repairOrganization'] = this.repairOrganization;
    data['repairPerson'] = this.repairPerson;
    data['dangerRemark'] = this.dangerRemark;
    data['dangerType'] = this.dangerType;
    data['equipmentName'] = this.equipmentName;
    data['createDate'] = this.createDate;
    return data;
  }
}

class Attachments {
  String fileName;
  String fileUrl;

  Attachments({this.fileName, this.fileUrl});

  Attachments.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this.fileName;
    data['fileUrl'] = this.fileUrl;
    return data;
  }
}
