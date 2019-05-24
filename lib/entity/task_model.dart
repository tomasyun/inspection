class TaskModel {
  int code;
  String msg;
  Data data;

  TaskModel({this.code, this.msg, this.data});

  TaskModel.fromJson(Map<String, dynamic> json) {
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
  List<Rectify> rectify;
  List<Review> review;
  List<Inspect> inspect;

  Data({this.rectify, this.review, this.inspect});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['rectify'] != null) {
      rectify = new List<Rectify>();
      json['rectify'].forEach((v) {
        rectify.add(new Rectify.fromJson(v));
      });
    }
    if (json['review'] != null) {
      review = new List<Review>();
      json['review'].forEach((v) {
        review.add(new Review.fromJson(v));
      });
    }
    if (json['inspect'] != null) {
      inspect = new List<Inspect>();
      json['inspect'].forEach((v) {
        inspect.add(new Inspect.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rectify != null) {
      data['rectify'] = this.rectify.map((v) => v.toJson()).toList();
    }
    if (this.review != null) {
      data['review'] = this.review.map((v) => v.toJson()).toList();
    }
    if (this.inspect != null) {
      data['inspect'] = this.inspect.map((v) => v.toJson()).toList();
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
