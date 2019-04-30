import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MineAction {
  action,
  userInfo,
  task,
  report,
  rectify,
  recheck,
  updatePassword,
  update,
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

  static Action onSkipMineRectify() {
    return Action(MineAction.rectify);
  }

  static Action onSkipMineRecheck() {
    return Action(MineAction.recheck);
  }

  static Action onSkipMineUpdatePassword() {
    return Action(MineAction.updatePassword);
  }

  static Action onSkipMineUpdate() {
    return Action(MineAction.update);
  }
}
