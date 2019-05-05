import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum InfoAction { action, repairRecord, keepRecord }

class InfoActionCreator {
  static Action onAction() {
    return const Action(InfoAction.action);
  }

  static Action onSkipRepairRecord() {
    return Action(InfoAction.repairRecord);
  }

  static Action onSkipKeepRecord() {
    return Action(InfoAction.keepRecord);
  }
}
