class WarningModel {
  String level;
  String deviceName;
  String reason;
  String depart;
  String pic;

  WarningModel(
      {this.level, this.deviceName, this.reason, this.depart, this.pic});

  WarningModel.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    deviceName = json['devname'];
    reason = json['reason'];
    depart = json['depart'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['devname'] = this.deviceName;
    data['reason'] = this.reason;
    data['depart'] = this.depart;
    data['pic'] = this.pic;
    return data;
  }
}
