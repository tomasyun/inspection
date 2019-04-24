class RepairRecord {
  String state;
  String desc;
  String name;
  String date;
  String depart;
  String applicant;

  RepairRecord(
      {this.state,
      this.desc,
      this.name,
      this.date,
      this.depart,
      this.applicant});

  RepairRecord.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    desc = json['desc'];
    name = json['name'];
    date = json['date'];
    depart = json['depart'];
    applicant = json['applicant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['desc'] = this.desc;
    data['name'] = this.name;
    data['date'] = this.date;
    data['depart'] = this.depart;
    data['applicant'] = this.applicant;
    return data;
  }
}
