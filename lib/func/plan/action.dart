import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum PlanAction { action }

class PlanActionCreator {
  static Action onAction() {
    return const Action(PlanAction.action);
  }
}
