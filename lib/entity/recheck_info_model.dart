/**
* {
	"code": 0,
	"msg": "成功",
	"data": {
		"reviewOrganization": "研发部",
		"reviewResult": "完成",
		"reviewDate": null,
		"reviewAttachments": [{
			"fileName": "c64990ffd2b949fd9157ff1845adc7d1.jpg",
			"fileUrl": "/img/d6afcd23ba764cfa8cda6508298ef213.jpg"
		}, {
			"fileName": "c64990ffd2b949fd9157ff1845adc7d1.jpg",
			"fileUrl": "/img/789c4e0c4da04c20b013ced2a02278b4.jpg"
		}, {
			"fileName": "c64990ffd2b949fd9157ff1845adc7d1.jpg",
			"fileUrl": "/img/03e37314a83e409689d19359c69ebb0a.jpg"
		}],
		"reviewUser": "系统管理员"
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
  String reviewOrganization;
  String reviewResult;
  String reviewDate;
  List<ReviewAttachments> reviewAttachments;
  String reviewUser;

  Data(
      {this.reviewOrganization,
      this.reviewResult,
      this.reviewDate,
      this.reviewAttachments,
      this.reviewUser});

  Data.fromJson(Map<String, dynamic> json) {
    reviewOrganization = json['reviewOrganization'];
    reviewResult = json['reviewResult'];
    reviewDate = json['reviewDate'];
    if (json['reviewAttachments'] != null) {
      reviewAttachments = new List<ReviewAttachments>();
      json['reviewAttachments'].forEach((v) {
        reviewAttachments.add(new ReviewAttachments.fromJson(v));
      });
    }
    reviewUser = json['reviewUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviewOrganization'] = this.reviewOrganization;
    data['reviewResult'] = this.reviewResult;
    data['reviewDate'] = this.reviewDate;
    if (this.reviewAttachments != null) {
      data['reviewAttachments'] =
          this.reviewAttachments.map((v) => v.toJson()).toList();
    }
    data['reviewUser'] = this.reviewUser;
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
