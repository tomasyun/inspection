import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SettingAction { action, upgradePassword, upgradeVersion, logout }

class SettingActionCreator {
  static Action onAction() {
    return const Action(SettingAction.action);
  }

  static Action onSkipUpgradePassword() {
    return Action(SettingAction.upgradePassword);
  }

  static Action onUpgradeVersion() {
    return Action(SettingAction.upgradeVersion);
  }

  static Action onLogout() {
    return Action(SettingAction.logout);
  }
}
