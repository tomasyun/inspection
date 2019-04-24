import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecordItemAction { action }

class RecordItemActionCreator {
  static Action onAction() {
    return const Action(RecordItemAction.action);
  }
}
