class InspectContentModel {
  int code;
  String msg;
  List<Data> data;

  InspectContentModel({
    this.code,
    this.msg,
    this.data,
  });

  InspectContentModel.fromJson(Map<String, dynamic> json) {
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
  String targetName;
  String targetId;
  bool isOpen = true;

  Data({
    this.targetName,
    this.targetId,
    this.isOpen,
  });

  Data.fromJson(Map<String, dynamic> json) {
    targetName = json['targetName'];
    targetId = json['targetId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['targetName'] = this.targetName;
    data['targetId'] = this.targetId;
    return data;
  }
}
