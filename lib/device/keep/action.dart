import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/keep_record_model.dart';

//TODO replace with your own action
enum KeepAction { action }

class KeepActionCreator {
  static Action onAction(KeepRecordModel list) {
    return Action(
      KeepAction.action,
      payload: list,
    );
  }
}
