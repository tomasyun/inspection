import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/notice_model.dart';

class NoticeState implements Cloneable<NoticeState> {
  List<NoticeModel> list;
  @override
  NoticeState clone() {
    return NoticeState()..list = list;
  }
}

NoticeState initState(Map<String, dynamic> args) {
  return NoticeState();
}
