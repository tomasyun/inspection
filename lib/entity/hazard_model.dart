class HazardModel {
  String desc;
  String depart;
  String data;
  String state;
  String rectifier;

  HazardModel({this.desc, this.depart, this.data, this.state, this.rectifier});

  HazardModel.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    depart = json['depart'];
    data = json['data'];
    state = json['state'];
    rectifier = json['rectifier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['depart'] = this.depart;
    data['data'] = this.data;
    data['state'] = this.state;
    data['rectifier'] = this.rectifier;
    return data;
  }
}
