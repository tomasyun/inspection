import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HazardItemAction { action }

class HazardItemActionCreator {
  static Action onAction() {
    return const Action(HazardItemAction.action);
  }
}
