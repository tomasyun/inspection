class UserModel {
  String userName;
  String name;
  String avatar;
  String company;
  String depart;

  UserModel({this.userName, this.name, this.avatar, this.company, this.depart});

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    name = json['name'];
    avatar = json['avatar'];
    company = json['company'];
    depart = json['depart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['company'] = this.company;
    data['depart'] = this.depart;
    return data;
  }
}
