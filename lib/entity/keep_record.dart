class KeepRecord {
  String state;
  String remark;
  String keeper;
  String date;

  KeepRecord({this.state, this.remark, this.keeper, this.date});

  KeepRecord.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    remark = json['remark'];
    keeper = json['keeper'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['remark'] = this.remark;
    data['keeper'] = this.keeper;
    data['date'] = this.date;
    return data;
  }
}
