import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum NoticeItemAction { action }

class NoticeItemActionCreator {
  static Action onAction() {
    return const Action(NoticeItemAction.action);
  }
}
