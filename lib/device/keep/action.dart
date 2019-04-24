import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/keep_record.dart';

//TODO replace with your own action
enum KeepAction { action }

class KeepActionCreator {
  static Action onAction(List<KeepRecord> list) {
    return Action(KeepAction.action, payload: list);
  }
}
