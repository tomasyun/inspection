class NoticeModel {
  String title;
  String content;
  String date;

  NoticeModel({this.title, this.content, this.date});

  NoticeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['content'] = this.content;
    data['date'] = this.date;
    return data;
  }
}
