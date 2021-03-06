class RectifyInfoModel {
  int code;
  String msg;
  Data data;

  RectifyInfoModel({
    this.code,
    this.msg,
    this.data,
  });

  RectifyInfoModel.fromJson(Map<String, dynamic> json) {
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
  String repairOrganization;
  String repairResult;
  List<RepairAttachments> repairAttachments;
  String repairUser;
  String repairOpinion;
  String repairDate;
  String reviewUser;
  String reviewDate;
  String reviewOrganization;

  Data({
    this.repairOrganization,
    this.repairResult,
    this.repairAttachments,
    this.repairUser,
    this.repairOpinion,
    this.repairDate,
    this.reviewUser,
    this.reviewDate,
    this.reviewOrganization,
  });

  Data.fromJson(Map<String, dynamic> json) {
    repairOrganization = json['repairOrganization'];
    repairResult = json['repairResult'];
    if (json['repairAttachments'] != null) {
      repairAttachments = new List<RepairAttachments>();
      json['repairAttachments'].forEach((v) {
        repairAttachments.add(new RepairAttachments.fromJson(v));
      });
    }
    repairUser = json['repairUser'];
    repairOpinion = json['repairOpinion'];
    repairDate = json['repairDate'];
    reviewUser = json['reviewUser'];
    reviewDate = json['reviewDate'];
    reviewOrganization = json['reviewOrganization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['repairOrganization'] = this.repairOrganization;
    data['repairResult'] = this.repairResult;
    if (this.repairAttachments != null) {
      data['repairAttachments'] =
          this.repairAttachments.map((v) => v.toJson()).toList();
    }
    data['repairUser'] = this.repairUser;
    data['repairOpinion'] = this.repairOpinion;
    data['repairDate'] = this.repairDate;
    data['reviewUser'] = this.repairOpinion;
    data['reviewDate'] = this.reviewDate;
    data['reviewOrganization'] = this.reviewOrganization;
    return data;
  }
}

class RepairAttachments {
  String fileName;
  String fileUrl;

  RepairAttachments({this.fileName, this.fileUrl});

  RepairAttachments.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileName'] = this.fileName;
    data['fileUrl'] = this.fileUrl;
    return data;
  }
}
