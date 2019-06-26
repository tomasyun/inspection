import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/notice_model.dart';

//TODO replace with your own action
enum NoticeItemAction {
  action,
  delete,
  onDelete,
}

class NoticeItemActionCreator {
  static Action onAction() {
    return const Action(NoticeItemAction.action);
  }

  static Action onDeleteAction() {
    return Action(NoticeItemAction.onDelete);
  }

  static Action onDelete(NoticeModel model) {
    return Action(
      NoticeItemAction.delete,
      payload: model,
    );
  }
}
