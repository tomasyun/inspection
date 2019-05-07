import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum InspectPlanAction { action }

class InspectPlanActionCreator {
  static Action onAction() {
    return const Action(InspectPlanAction.action);
  }
}
