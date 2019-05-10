import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HistoryItemAction { action, skipInfo }

class HistoryItemActionCreator {
  static Action onAction() {
    return const Action(HistoryItemAction.action);
  }

  static Action onSkipInfo() {
    return Action(HistoryItemAction.skipInfo);
  }
}
