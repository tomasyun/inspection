import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_model.dart';

//TODO replace with your own action
enum InspectPlanAction { action, plans }

class InspectPlanActionCreator {
  static Action onAction() {
    return const Action(InspectPlanAction.action);
  }

  static Action onGetInspectPlans(List<PlanModel> list) {
    return Action(InspectPlanAction.plans, payload: list);
  }
}
