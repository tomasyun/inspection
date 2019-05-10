class HazardModel {
  String desc;
  String depart;
  String date;
  String state;
  String rectifier;

  HazardModel({this.desc, this.depart, this.date, this.state, this.rectifier});

  HazardModel.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    depart = json['depart'];
    date = json['date'];
    state = json['state'];
    rectifier = json['rectifier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['depart'] = this.depart;
    data['date'] = this.date;
    data['state'] = this.state;
    data['rectifier'] = this.rectifier;
    return data;
  }
}
