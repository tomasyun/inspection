import 'package:fish_redux/fish_redux.dart';

class NoticeState implements Cloneable<NoticeState> {
  @override
  NoticeState clone() {
    return NoticeState();
  }
}

NoticeState initState(Map<String, dynamic> args) {
  return NoticeState();
}
