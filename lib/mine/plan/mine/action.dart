import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_model.dart';

//TODO replace with your own action
enum MinePlanAction { action, plans }

class MinePlanActionCreator {
  static Action onAction() {
    return const Action(MinePlanAction.action);
  }

  static Action onGetMinePlans(PlanModel list) {
    return Action(MinePlanAction.plans, payload: list);
  }
}
