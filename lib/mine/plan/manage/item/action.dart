import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum InspectPlanItemAction { action }

class InspectPlanItemActionCreator {
  static Action onAction() {
    return const Action(InspectPlanItemAction.action);
  }
}
