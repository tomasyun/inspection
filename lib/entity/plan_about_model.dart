class PlanAboutModel {
  String deviceName;
  String location;
  String deviceNo;
  String deviceType;
  String taskState;

  PlanAboutModel(
      {this.deviceName,
      this.location,
      this.deviceNo,
      this.deviceType,
      this.taskState});

  PlanAboutModel.fromJson(Map<String, dynamic> json) {
    deviceName = json['deviceName'];
    location = json['location'];
    deviceNo = json['deviceNo'];
    deviceType = json['deviceType'];
    taskState = json['taskState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceName'] = this.deviceName;
    data['location'] = this.location;
    data['deviceNo'] = this.deviceNo;
    data['deviceType'] = this.deviceType;
    data['taskState'] = this.taskState;
    return data;
  }
}
