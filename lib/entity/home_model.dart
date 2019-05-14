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
  List<Rectify> rectify;
  List<Review> review;
  List<Inspect> inspect;

  Todos({this.rectify, this.review, this.inspect});

  Todos.fromJson(Map<String, dynamic> json) {
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

  Rectify(
      {this.dangerRemark,
      this.dangerAddress,
      this.dangerType,
      this.todoType,
      this.equipmentCode,
      this.dangerLevel,
      this.equipmentName});

  Rectify.fromJson(Map<String, dynamic> json) {
    dangerRemark = json['dangerRemark'];
    dangerAddress = json['dangerAddress'];
    dangerType = json['dangerType'];
    todoType = json['todoType'];
    equipmentCode = json['equipmentCode'];
    dangerLevel = json['dangerLevel'];
    equipmentName = json['equipmentName'];
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

  Review(
      {this.dangerRemark,
      this.dangerAddress,
      this.dangerType,
      this.todoType,
      this.equipmentCode,
      this.dangerLevel,
      this.equipmentName});

  Review.fromJson(Map<String, dynamic> json) {
    dangerRemark = json['dangerRemark'];
    dangerAddress = json['dangerAddress'];
    dangerType = json['dangerType'];
    todoType = json['todoType'];
    equipmentCode = json['equipmentCode'];
    dangerLevel = json['dangerLevel'];
    equipmentName = json['equipmentName'];
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
    return data;
  }
}

class Inspect {
  String installArea;
  String equipmentCode;
  String equipmentName;
  String equipmentType;
  int status;

  Inspect(
      {this.installArea,
      this.equipmentCode,
      this.equipmentName,
      this.equipmentType,
      this.status});

  Inspect.fromJson(Map<String, dynamic> json) {
    installArea = json['installArea'];
    equipmentCode = json['equipmentCode'];
    equipmentName = json['equipmentName'];
    equipmentType = json['equipmentType'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['installArea'] = this.installArea;
    data['equipmentCode'] = this.equipmentCode;
    data['equipmentName'] = this.equipmentName;
    data['equipmentType'] = this.equipmentType;
    data['status'] = this.status;
    return data;
  }
}
