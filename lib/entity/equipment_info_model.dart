class EquipmentInfoModel {
  int code;
  String msg;
  Data data;

  EquipmentInfoModel({
    this.code,
    this.msg,
    this.data,
  });

  EquipmentInfoModel.fromJson(Map<String, dynamic> json) {
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
  String id;
  String equipmentCode;
  String equipmentName;
  String companyId;
  String companyName;
  String organizationId;
  String organizationName;
  String equipmentPersonLiableId;
  String equipmentPersonLiableName;
  String equipmentType;
  String equipmentModel;
  String equipmentStatus;
  String installArea;
  String equipmentManufacturer;
  String equipmentManufactureTime;
  String nextRepairTime;
  String scrapTime;
  String qrCode;
  String planId;
  String remark;
  String createUser;
  String createDate;
  String updateUser;
  String updateDate;
  bool delFlag;
  List<SmsEquipmentDiyColumnsList> smsEquipmentDiyColumnsList;
  List<SmsEquipmentMaintainInfoList> smsEquipmentMaintainInfoList;
  List<SmsEquipmentRepairInfoList> smsEquipmentRepairInfoList;

  Data(
      {this.id,
      this.equipmentCode,
      this.equipmentName,
      this.companyId,
      this.companyName,
      this.organizationId,
      this.organizationName,
      this.equipmentPersonLiableId,
      this.equipmentPersonLiableName,
      this.equipmentType,
      this.equipmentModel,
      this.equipmentStatus,
      this.installArea,
      this.equipmentManufacturer,
      this.equipmentManufactureTime,
      this.nextRepairTime,
      this.scrapTime,
      this.qrCode,
      this.planId,
      this.remark,
      this.createUser,
      this.createDate,
      this.updateUser,
      this.updateDate,
      this.delFlag,
      this.smsEquipmentDiyColumnsList,
      this.smsEquipmentMaintainInfoList,
      this.smsEquipmentRepairInfoList});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    equipmentCode = json['equipmentCode'];
    equipmentName = json['equipmentName'];
    companyId = json['companyId'];
    companyName = json['companyName'];
    organizationId = json['organizationId'];
    organizationName = json['organizationName'];
    equipmentPersonLiableId = json['equipmentPersonLiableId'];
    equipmentPersonLiableName = json['equipmentPersonLiableName'];
    equipmentType = json['equipmentType'];
    equipmentModel = json['equipmentModel'];
    equipmentStatus = json['equipmentStatus'];
    installArea = json['installArea'];
    equipmentManufacturer = json['equipmentManufacturer'];
    equipmentManufactureTime = json['equipmentManufactureTime'];
    nextRepairTime = json['nextRepairTime'];
    scrapTime = json['scrapTime'];
    qrCode = json['qrCode'];
    planId = json['planId'];
    remark = json['remark'];
    createUser = json['createUser'];
    createDate = json['createDate'];
    updateUser = json['updateUser'];
    updateDate = json['updateDate'];
    delFlag = json['delFlag'];
    if (json['smsEquipmentDiyColumnsList'] != null) {
      smsEquipmentDiyColumnsList = new List<SmsEquipmentDiyColumnsList>();
      json['smsEquipmentDiyColumnsList'].forEach((v) {
        smsEquipmentDiyColumnsList
            .add(new SmsEquipmentDiyColumnsList.fromJson(v));
      });
    }
    if (json['smsEquipmentMaintainInfoList'] != null) {
      smsEquipmentMaintainInfoList = new List<SmsEquipmentMaintainInfoList>();
      json['smsEquipmentMaintainInfoList'].forEach((v) {
        smsEquipmentMaintainInfoList
            .add(new SmsEquipmentMaintainInfoList.fromJson(v));
      });
    }
    if (json['smsEquipmentRepairInfoList'] != null) {
      smsEquipmentRepairInfoList = new List<SmsEquipmentRepairInfoList>();
      json['smsEquipmentRepairInfoList'].forEach((v) {
        smsEquipmentRepairInfoList
            .add(new SmsEquipmentRepairInfoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['equipmentCode'] = this.equipmentCode;
    data['equipmentName'] = this.equipmentName;
    data['companyId'] = this.companyId;
    data['companyName'] = this.companyName;
    data['organizationId'] = this.organizationId;
    data['organizationName'] = this.organizationName;
    data['equipmentPersonLiableId'] = this.equipmentPersonLiableId;
    data['equipmentPersonLiableName'] = this.equipmentPersonLiableName;
    data['equipmentType'] = this.equipmentType;
    data['equipmentModel'] = this.equipmentModel;
    data['equipmentStatus'] = this.equipmentStatus;
    data['installArea'] = this.installArea;
    data['equipmentManufacturer'] = this.equipmentManufacturer;
    data['equipmentManufactureTime'] = this.equipmentManufactureTime;
    data['nextRepairTime'] = this.nextRepairTime;
    data['scrapTime'] = this.scrapTime;
    data['qrCode'] = this.qrCode;
    data['planId'] = this.planId;
    data['remark'] = this.remark;
    data['createUser'] = this.createUser;
    data['createDate'] = this.createDate;
    data['updateUser'] = this.updateUser;
    data['updateDate'] = this.updateDate;
    data['delFlag'] = this.delFlag;
    if (this.smsEquipmentDiyColumnsList != null) {
      data['smsEquipmentDiyColumnsList'] =
          this.smsEquipmentDiyColumnsList.map((v) => v.toJson()).toList();
    }
    if (this.smsEquipmentMaintainInfoList != null) {
      data['smsEquipmentMaintainInfoList'] =
          this.smsEquipmentMaintainInfoList.map((v) => v.toJson()).toList();
    }
    if (this.smsEquipmentRepairInfoList != null) {
      data['smsEquipmentRepairInfoList'] =
          this.smsEquipmentRepairInfoList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SmsEquipmentDiyColumnsList {
  String key1;
  String key2;

  SmsEquipmentDiyColumnsList({this.key1, this.key2});

  SmsEquipmentDiyColumnsList.fromJson(Map<String, dynamic> json) {
    key1 = json['key1'];
    key2 = json['key2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key1'] = this.key1;
    data['key2'] = this.key2;
    return data;
  }
}

class SmsEquipmentMaintainInfoList {
  String id;
  String equipmentId;
  String equipmentName;
  String organizationId;
  String organizationName;
  String personLiableId;
  String personLiableName;
  String maintainPersonId;
  String maintainPersonName;
  String maintainDate;
  String remark;
  String createUser;
  String createDate;
  String updateUser;
  String updateDate;
  bool delFlag;

  SmsEquipmentMaintainInfoList(
      {this.id,
      this.equipmentId,
      this.equipmentName,
      this.organizationId,
      this.organizationName,
      this.personLiableId,
      this.personLiableName,
      this.maintainPersonId,
      this.maintainPersonName,
      this.maintainDate,
      this.remark,
      this.createUser,
      this.createDate,
      this.updateUser,
      this.updateDate,
      this.delFlag});

  SmsEquipmentMaintainInfoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    equipmentId = json['equipmentId'];
    equipmentName = json['equipmentName'];
    organizationId = json['organizationId'];
    organizationName = json['organizationName'];
    personLiableId = json['personLiableId'];
    personLiableName = json['personLiableName'];
    maintainPersonId = json['maintainPersonId'];
    maintainPersonName = json['maintainPersonName'];
    maintainDate = json['maintainDate'];
    remark = json['remark'];
    createUser = json['createUser'];
    createDate = json['createDate'];
    updateUser = json['updateUser'];
    updateDate = json['updateDate'];
    delFlag = json['delFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['equipmentId'] = this.equipmentId;
    data['equipmentName'] = this.equipmentName;
    data['organizationId'] = this.organizationId;
    data['organizationName'] = this.organizationName;
    data['personLiableId'] = this.personLiableId;
    data['personLiableName'] = this.personLiableName;
    data['maintainPersonId'] = this.maintainPersonId;
    data['maintainPersonName'] = this.maintainPersonName;
    data['maintainDate'] = this.maintainDate;
    data['remark'] = this.remark;
    data['createUser'] = this.createUser;
    data['createDate'] = this.createDate;
    data['updateUser'] = this.updateUser;
    data['updateDate'] = this.updateDate;
    data['delFlag'] = this.delFlag;
    return data;
  }
}

class SmsEquipmentRepairInfoList {
  String id;
  String equipmentId;
  String equipmentName;
  String organizationId;
  String organizationName;
  String personLiableId;
  String personLiableName;
  String repairPersonId;
  String repairPersonName;
  String repairDate;
  String remark;
  String createUser;
  String createDate;
  String updateUser;
  String updateDate;
  bool delFlag;

  SmsEquipmentRepairInfoList(
      {this.id,
      this.equipmentId,
      this.equipmentName,
      this.organizationId,
      this.organizationName,
      this.personLiableId,
      this.personLiableName,
      this.repairPersonId,
      this.repairPersonName,
      this.repairDate,
      this.remark,
      this.createUser,
      this.createDate,
      this.updateUser,
      this.updateDate,
      this.delFlag});

  SmsEquipmentRepairInfoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    equipmentId = json['equipmentId'];
    equipmentName = json['equipmentName'];
    organizationId = json['organizationId'];
    organizationName = json['organizationName'];
    personLiableId = json['personLiableId'];
    personLiableName = json['personLiableName'];
    repairPersonId = json['repairPersonId'];
    repairPersonName = json['repairPersonName'];
    repairDate = json['repairDate'];
    remark = json['remark'];
    createUser = json['createUser'];
    createDate = json['createDate'];
    updateUser = json['updateUser'];
    updateDate = json['updateDate'];
    delFlag = json['delFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['equipmentId'] = this.equipmentId;
    data['equipmentName'] = this.equipmentName;
    data['organizationId'] = this.organizationId;
    data['organizationName'] = this.organizationName;
    data['personLiableId'] = this.personLiableId;
    data['personLiableName'] = this.personLiableName;
    data['repairPersonId'] = this.repairPersonId;
    data['repairPersonName'] = this.repairPersonName;
    data['repairDate'] = this.repairDate;
    data['remark'] = this.remark;
    data['createUser'] = this.createUser;
    data['createDate'] = this.createDate;
    data['updateUser'] = this.updateUser;
    data['updateDate'] = this.updateDate;
    data['delFlag'] = this.delFlag;
    return data;
  }
}
