class ToDosModel {
  List<Rectify> rectify;
  List<Recheck> recheck;
  List<Keep> keep;
  List<Inspect> inspect;

  ToDosModel({this.rectify, this.recheck, this.keep, this.inspect});

  ToDosModel.fromJson(Map<String, dynamic> json) {
    if (json['rectify'] != null) {
      rectify = new List<Rectify>();
      json['rectify'].forEach((v) {
        rectify.add(new Rectify.fromJson(v));
      });
    }
    if (json['recheck'] != null) {
      recheck = new List<Recheck>();
      json['recheck'].forEach((v) {
        recheck.add(new Recheck.fromJson(v));
      });
    }
    if (json['keep'] != null) {
      keep = new List<Keep>();
      json['keep'].forEach((v) {
        keep.add(new Keep.fromJson(v));
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
    if (this.recheck != null) {
      data['recheck'] = this.recheck.map((v) => v.toJson()).toList();
    }
    if (this.keep != null) {
      data['keep'] = this.keep.map((v) => v.toJson()).toList();
    }
    if (this.inspect != null) {
      data['inspect'] = this.inspect.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rectify {
  String desc;
  String depart;
  String date;
  String state;
  String rectifier;

  Rectify({this.desc, this.depart, this.date, this.state, this.rectifier});

  Rectify.fromJson(Map<String, dynamic> json) {
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

class Recheck {
  String desc;
  String depart;
  String date;
  String rechecker;
  String state;

  Recheck({this.desc, this.depart, this.date, this.rechecker, this.state});

  Recheck.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    depart = json['depart'];
    date = json['date'];
    rechecker = json['rechecker'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['depart'] = this.depart;
    data['date'] = this.date;
    data['rechecker'] = this.rechecker;
    data['state'] = this.state;
    return data;
  }
}

class Keep {
  String state;
  String remark;
  String keeper;
  String date;

  Keep({this.state, this.remark, this.keeper, this.date});

  Keep.fromJson(Map<String, dynamic> json) {
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

class Inspect {
  String name;
  String pic;
  String depart;
  String state;

  Inspect({this.name, this.pic, this.depart, this.state});

  Inspect.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pic = json['pic'];
    depart = json['depart'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['pic'] = this.pic;
    data['depart'] = this.depart;
    data['state'] = this.state;
    return data;
  }
}
