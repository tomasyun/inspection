class RecheckInfoModel {
  int code;
  String msg;
  Data data;

  RecheckInfoModel({
    this.code,
    this.msg,
    this.data,
  });

  RecheckInfoModel.fromJson(Map<String, dynamic> json) {
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
  String reviewOrganization;
  String reviewResult;
  String reviewDate;
  List<ReviewAttachments> reviewAttachments;
  String repairUser;
  String reviewUser;
  String repairDate;

  Data({
    this.repairOrganization,
    this.reviewOrganization,
    this.reviewResult,
    this.reviewDate,
    this.reviewAttachments,
    this.repairUser,
    this.reviewUser,
    this.repairDate,
  });

  Data.fromJson(Map<String, dynamic> json) {
    repairOrganization = json['repairOrganization'];
    reviewOrganization = json['reviewOrganization'];
    reviewResult = json['reviewResult'];
    reviewDate = json['reviewDate'];
    if (json['reviewAttachments'] != null) {
      reviewAttachments = new List<ReviewAttachments>();
      json['reviewAttachments'].forEach((v) {
        reviewAttachments.add(new ReviewAttachments.fromJson(v));
      });
    }
    repairUser = json['repairUser'];
    reviewUser = json['reviewUser'];
    repairDate = json['repairDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['repairOrganization'] = this.repairOrganization;
    data['reviewOrganization'] = this.reviewOrganization;
    data['reviewResult'] = this.reviewResult;
    data['reviewDate'] = this.reviewDate;
    if (this.reviewAttachments != null) {
      data['reviewAttachments'] =
          this.reviewAttachments.map((v) => v.toJson()).toList();
    }
    data['repairUser'] = this.repairUser;
    data['reviewUser'] = this.reviewUser;
    data['repairDate'] = this.repairDate;
    return data;
  }
}

class ReviewAttachments {
  String fileName;
  String fileUrl;

  ReviewAttachments({this.fileName, this.fileUrl});

  ReviewAttachments.fromJson(Map<String, dynamic> json) {
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
