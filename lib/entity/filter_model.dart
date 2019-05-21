/**
 * {
    "code": 0,
    "msg": "成功",
    "data": [{
    "name": "研发部",
    "id": "1"
    }, {
    "name": "研发部分部",
    "id": "2"
    }, {
    "name": "市场部",
    "id": "3"
    }, {
    "name": "市场一部1",
    "id": "4"
    }, {
    "name": "施工组",
    "id": "5"
    }, {
    "name": "安委会",
    "id": "6"
    }, {
    "name": "工程部",
    "id": "7"
    }]
    }
 */

class FilterModel {
  int code;
  String msg;
  List<Data> data;

  FilterModel({this.code, this.msg, this.data});

  FilterModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String name;
  String id;

  Data({this.name, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
