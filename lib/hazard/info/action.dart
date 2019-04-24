import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HazardInfoAction { action }

class HazardInfoActionCreator {
  static Action onAction() {
    return const Action(HazardInfoAction.action);
  }
}
