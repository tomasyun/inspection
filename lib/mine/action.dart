import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MineAction {
  action,
  userInfo,
  task,
  report,
  setting,
  hazardHistory,
  upgradePassword,
  baseInfo,
}

class MineActionCreator {
  static Action onAction() {
    return const Action(MineAction.action);
  }

  static Action onSkipUserInfo() {
    return Action(MineAction.userInfo);
  }

  static Action onSkipMineTask() {
    return Action(MineAction.task);
  }

  static Action onSkipMineReport() {
    return Action(MineAction.report);
  }

  static Action onSkipSetting() {
    return Action(MineAction.setting);
  }

  static Action onSkipHazardHistory() {
    return Action(MineAction.hazardHistory);
  }

  static Action onUpdatePasswordAction() {
    return Action(MineAction.upgradePassword);
  }

  static Action onGetUserInfo(Map<String, String> map) {
    return Action(MineAction.baseInfo, payload: map);
  }
}
