import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/notice_model.dart';

class NoticeState implements Cloneable<NoticeState> {
  NoticeModel model;
  @override
  NoticeState clone() {
    return NoticeState()..model = model;
  }
}

NoticeState initState(Map<String, dynamic> args) {
  return NoticeState();
}
