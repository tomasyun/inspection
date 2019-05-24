/**
 * {
    "code": 0,
    "msg": "成功",
    "data": {
    "banner": [
    {
    "title": "访问学者申请，求指导",
    "url": "https://t12.baidu.com/it/u=4274442233,3886453010&fm=76"
    },
    {
    "title": "客流统计",
    "url": "https://t12.baidu.com/it/u=200946914,1200544386&fm=76"
    }
    ],
    "todos": {
    "rectify": {
    "dangerRemark": "隐患描述111",
    "dangerAddress": "汇鑫IBC B座1050",
    "dangerType": "消防隐患",
    "todoType": "1",
    "equipmentCode": "001",
    "dangerLevel": "重大隐患",
    "equipmentName": "灭火器001",
    "dangerId": "3"
    },
    "review": {
    "dangerRemark": "隐患描述",
    "dangerAddress": "汇鑫IBC B座1050",
    "dangerType": "消防隐患",
    "todoType": "2",
    "equipmentCode": "001",
    "dangerLevel": "一般隐患",
    "equipmentName": "灭火器001",
    "dangerId": "2"
    },
    "inspect": {
    "installArea": "汇鑫IBC B座1005室",
    "equipmentCode": "001",
    "equipmentName": "灭火器001",
    "equipmentType": "灭火器",
    "status": 0
    }
    },
    "notice": "7987987"
    }
    }
 */

class HomeModel {
  int code;
  String msg;
  Data data;

  HomeModel({this.code, this.msg, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Banner> banner;
  Todos todos;
  String notice;

  Data({this.banner, this.todos, this.notice});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banner'] != null) {
      banner = new List<Banner>();
      json['banner'].forEach((v) {
        banner.add(new Banner.fromJson(v));
      });
    }
    todos = json['todos'] != null ? new Todos.fromJson(json['todos']) : null;
    notice = json['notice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner != null) {
      data['banner'] = this.banner.map((v) => v.toJson()).toList();
    }
    if (this.todos != null) {
      data['todos'] = this.todos.toJson();
    }
    data['notice'] = this.notice;
    return data;
  }
}

class Banner {
  String title;
  String url;

  Banner({this.title, this.url});

  Banner.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

class Todos {
  Rectify rectify;
  Review review;
  Inspect inspect;

  Todos({this.rectify, this.review, this.inspect});

  Todos.fromJson(Map<String, dynamic> json) {
    rectify =
        json['rectify'] != null ? new Rectify.fromJson(json['rectify']) : null;
    review =
        json['review'] != null ? new Review.fromJson(json['review']) : null;
    inspect =
        json['inspect'] != null ? new Inspect.fromJson(json['inspect']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rectify != null) {
      data['rectify'] = this.rectify.toJson();
    }
    if (this.review != null) {
      data['review'] = this.review.toJson();
    }
    if (this.inspect != null) {
      data['inspect'] = this.inspect.toJson();
    }
    return data;
  }
}

class Rectify {
  String dangerRemark;
  String dangerAddress;
  String dangerType;
  String todoType;
  String equipmentCode;
  String dangerLevel;
  String equipmentName;
  String dangerId;

  Rectify(
      {this.dangerRemark,
      this.dangerAddress,
      this.dangerType,
      this.todoType,
      this.equipmentCode,
      this.dangerLevel,
      this.equipmentName,
      this.dangerId});

  Rectify.fromJson(Map<String, dynamic> json) {
    dangerRemark = json['dangerRemark'];
    dangerAddress = json['dangerAddress'];
    dangerType = json['dangerType'];
    todoType = json['todoType'];
    equipmentCode = json['equipmentCode'];
    dangerLevel = json['dangerLevel'];
    equipmentName = json['equipmentName'];
    dangerId = json['dangerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dangerRemark'] = this.dangerRemark;
    data['dangerAddress'] = this.dangerAddress;
    data['dangerType'] = this.dangerType;
    data['todoType'] = this.todoType;
    data['equipmentCode'] = this.equipmentCode;
    data['dangerLevel'] = this.dangerLevel;
    data['equipmentName'] = this.equipmentName;
    data['dangerId'] = this.dangerId;
    return data;
  }
}

class Review {
  String dangerRemark;
  String dangerAddress;
  String dangerType;
  String todoType;
  String equipmentCode;
  String dangerLevel;
  String equipmentName;
  String dangerId;

  Review(
      {this.dangerRemark,
      this.dangerAddress,
      this.dangerType,
      this.todoType,
      this.equipmentCode,
      this.dangerLevel,
      this.equipmentName,
      this.dangerId});

  Review.fromJson(Map<String, dynamic> json) {
    dangerRemark = json['dangerRemark'];
    dangerAddress = json['dangerAddress'];
    dangerType = json['dangerType'];
    todoType = json['todoType'];
    equipmentCode = json['equipmentCode'];
    dangerLevel = json['dangerLevel'];
    equipmentName = json['equipmentName'];
    dangerId = json['dangerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dangerRemark'] = this.dangerRemark;
    data['dangerAddress'] = this.dangerAddress;
    data['dangerType'] = this.dangerType;
    data['todoType'] = this.todoType;
    data['equipmentCode'] = this.equipmentCode;
    data['dangerLevel'] = this.dangerLevel;
    data['equipmentName'] = this.equipmentName;
    data['dangerId'] = this.dangerId;
    return data;
  }
}

class Inspect {
  String installArea;
  String equipmentCode;
  String equipmentName;
  String equipmentType;
  int status;
  String equipmentId;

  Inspect(
      {this.installArea,
      this.equipmentCode,
      this.equipmentName,
      this.equipmentType,
      this.status,
      this.equipmentId});

  Inspect.fromJson(Map<String, dynamic> json) {
    installArea = json['installArea'];
    equipmentCode = json['equipmentCode'];
    equipmentName = json['equipmentName'];
    equipmentType = json['equipmentType'];
    status = json['status'];
    equipmentId = json['equipmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['installArea'] = this.installArea;
    data['equipmentCode'] = this.equipmentCode;
    data['equipmentName'] = this.equipmentName;
    data['equipmentType'] = this.equipmentType;
    data['status'] = this.status;
    data['equipmentId'] = this.equipmentId;
    return data;
  }
}
