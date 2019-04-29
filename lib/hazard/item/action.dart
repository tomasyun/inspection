import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HazardItemAction { action, skipInfo }

class HazardItemActionCreator {
  static Action onAction() {
    return const Action(HazardItemAction.action);
  }

  static Action onSkipInfo() {
    return Action(HazardItemAction.skipInfo);
  }
}
