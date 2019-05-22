class RepairRecordModel {
  int code;
  String msg;
  List<Data> data;

  RepairRecordModel({this.code, this.msg, this.data});

  RepairRecordModel.fromJson(Map<String, dynamic> json) {
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
  String organizationName;
  String personLiableName;
  String repairPersonName;
  String equipmentName;
  String repairDate;

  Data(
      {this.organizationName,
      this.personLiableName,
      this.repairPersonName,
      this.equipmentName,
      this.repairDate});

  Data.fromJson(Map<String, dynamic> json) {
    organizationName = json['organizationName'];
    personLiableName = json['personLiableName'];
    repairPersonName = json['repairPersonName'];
    equipmentName = json['equipmentName'];
    repairDate = json['repairDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organizationName'] = this.organizationName;
    data['personLiableName'] = this.personLiableName;
    data['repairPersonName'] = this.repairPersonName;
    data['equipmentName'] = this.equipmentName;
    data['repairDate'] = this.repairDate;
    return data;
  }
}
