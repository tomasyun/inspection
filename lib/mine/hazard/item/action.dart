import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HistoryItemAction { action }

class HistoryItemActionCreator {
  static Action onAction() {
    return const Action(HistoryItemAction.action);
  }
}
