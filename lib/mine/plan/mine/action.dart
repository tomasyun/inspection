import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MinePlanAction { action }

class MinePlanActionCreator {
  static Action onAction() {
    return const Action(MinePlanAction.action);
  }
}
