class RectifyFormModel {
  int code;
  String msg;
  Data data;

  RectifyFormModel({this.code, this.msg, this.data});

  RectifyFormModel.fromJson(Map<String, dynamic> json) {
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
  String repairOpinion;
  String id;

  Data({this.repairOpinion, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    repairOpinion = json['repairOpinion'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['repairOpinion'] = this.repairOpinion;
    data['id'] = this.id;
    return data;
  }
}
