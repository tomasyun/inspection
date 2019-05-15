class PlanModel {
  String planName;
  String planNo;
  String checkState;
  String planState;
  String depart;

  PlanModel(
      {this.planName,
      this.planNo,
      this.checkState,
      this.planState,
      this.depart});

  PlanModel.fromJson(Map<String, dynamic> json) {
    planName = json['planName'];
    planNo = json['planNo'];
    checkState = json['checkState'];
    planState = json['planState'];
    depart = json['depart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['planName'] = this.planName;
    data['planNo'] = this.planNo;
    data['checkState'] = this.checkState;
    data['planState'] = this.planState;
    data['depart'] = this.depart;
    return data;
  }
}
