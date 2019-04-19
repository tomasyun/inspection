import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DeviceAction { action }

class DeviceActionCreator {
  static Action onAction() {
    return const Action(DeviceAction.action);
  }
}
