import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum RecordAction { action }

class RecordActionCreator {
  static Action onAction() {
    return Action(RecordAction.action);
  }
}
