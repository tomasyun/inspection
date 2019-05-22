/**
 * {
    "code": 0,
    "msg": "成功",
    "data": {
    "repairOrganization": "研发部",
    "reviewOrganization": "研发部",
    "reviewResult": "略略略",
    "reviewDate": "2019-05-21 17:23",
    "reviewAttachments": [{
    "fileName": "magazine-unlock-06-2.3.1309-_E34D4081B941B58D8F56D110B862F624.jpg",
    "fileUrl": "/img/3991cdf86612495c9ecd5f634daa20ce.jpg"
    }, {
    "fileName": "magazine-unlock-03-2.3.1309-_D31A35DF8AD1D811B44E91096EC4AF9E.jpg",
    "fileUrl": "/img/d99bb050a0c34594b5bf4d18fcba8ed5.jpg"
    }, {
    "fileName": "magazine-unlock-06-2.3.1274-_D37305616D962CCCB0F84F0915DAE9BD.jpg",
    "fileUrl": "/img/20454e5aa3a14c18b30483da0ddb58b6.jpg"
    }],
    "repairUser": "系统管理员",
    "reviewUser": "系统管理员",
    "repairDate": "2019-05-11 01:07"
    }
    }
 */

class RecheckInfoModel {
  int code;
  String msg;
  Data data;

  RecheckInfoModel({this.code, this.msg, this.data});

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

  Data(
      {this.repairOrganization,
      this.reviewOrganization,
      this.reviewResult,
      this.reviewDate,
      this.reviewAttachments,
      this.repairUser,
      this.reviewUser,
      this.repairDate});

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
