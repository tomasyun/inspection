class KeepRecordModel {
  int code;
  String msg;
  List<Data> data;

  KeepRecordModel({
    this.code,
    this.msg,
    this.data,
  });

  KeepRecordModel.fromJson(Map<String, dynamic> json) {
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
  String maintainPersonName;
  String personLiableName;
  String equipmentName;
  String maintainDate;

  Data(
      {this.organizationName,
      this.maintainPersonName,
      this.personLiableName,
      this.equipmentName,
      this.maintainDate});

  Data.fromJson(Map<String, dynamic> json) {
    organizationName = json['organizationName'];
    maintainPersonName = json['maintainPersonName'];
    personLiableName = json['personLiableName'];
    equipmentName = json['equipmentName'];
    maintainDate = json['maintainDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organizationName'] = this.organizationName;
    data['maintainPersonName'] = this.maintainPersonName;
    data['personLiableName'] = this.personLiableName;
    data['equipmentName'] = this.equipmentName;
    data['maintainDate'] = this.maintainDate;
    return data;
  }
}
