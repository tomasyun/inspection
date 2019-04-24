class RepairRecItem {
  String state;
  String desc;
  String name;
  String date;
  String depart;
  String applyer;

  RepairRecItem(
      {String state,
      String desc,
      String name,
      String date,
      String depart,
      String applyer}) {
    this.state = state;
    this.desc = desc;
    this.name = name;
    this.date = date;
    this.depart = depart;
    this.applyer = applyer;
  }

  RepairRecItem.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    desc = json['desc'];
    name = json['name'];
    date = json['date'];
    depart = json['depart'];
    applyer = json['applyer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['desc'] = this.desc;
    data['name'] = this.name;
    data['date'] = this.date;
    data['depart'] = this.depart;
    data['applyer'] = this.applyer;
    return data;
  }
}
