/**
 * {
    "code": 0,
    "msg": "成功",
    "data": [{
    "messageId": "40288a9f6ab0743c016ab07a17f60000",
    "messageTitle": "习近平的一天如何度过？",
    "messageDate": "2019-05-13",
    "messageContent": "7987987"
    }]
    }
 */

class NoticeModel {
  int code;
  String msg;
  List<Data> data;

  NoticeModel({this.code, this.msg, this.data});

  NoticeModel.fromJson(Map<String, dynamic> json) {
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
  String messageTitle;
  String messageId;
  String messageDate;
  String messageContent;

  Data(
      {this.messageTitle,
      this.messageId,
      this.messageDate,
      this.messageContent});

  Data.fromJson(Map<String, dynamic> json) {
    messageTitle = json['messageTitle'];
    messageId = json['messageId'];
    messageDate = json['messageDate'];
    messageContent = json['messageContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageTitle'] = this.messageTitle;
    data['messageId'] = this.messageId;
    data['messageDate'] = this.messageDate;
    data['messageContent'] = this.messageContent;
    return data;
  }
}
