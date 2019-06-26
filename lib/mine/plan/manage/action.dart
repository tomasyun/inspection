import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_model.dart';

//TODO replace with your own action
enum InspectPlanAction {
  action,
  plans,
  search,
  reset,
  selectState,
  planState,
}

class InspectPlanActionCreator {
  static Action onAction() {
    return const Action(InspectPlanAction.action);
  }

  static Action onGetInspectPlans(PlanModel list) {
    return Action(InspectPlanAction.plans, payload: list);
  }

  static Action onSearchAction() {
    return Action(InspectPlanAction.search);
  }

  static Action onResetAction() {
    return Action(InspectPlanAction.reset);
  }

  static Action onSelectPlanStateAction() {
    return Action(InspectPlanAction.selectState);
  }

  static Action onGetPlanStateAction(String state) {
    return Action(
      InspectPlanAction.planState,
      payload: state,
    );
  }
}
