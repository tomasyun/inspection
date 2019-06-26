import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/notice_model.dart';

//TODO replace with your own action
enum NoticeAction {
  action,
  notices,
}

class NoticeActionCreator {
  static Action onAction() {
    return const Action(NoticeAction.action);
  }

  static Action onGetNotices(NoticeModel list) {
    return Action(NoticeAction.notices, payload: list);
  }
}
