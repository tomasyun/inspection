import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_about_model.dart';

//TODO replace with your own action
enum PlanAboutAction { action, planAbouts }

class PlanAboutActionCreator {
  static Action onAction() {
    return const Action(PlanAboutAction.action);
  }

  static Action onGetPlanAbouts(List<PlanAboutModel> list) {
    return Action(PlanAboutAction.planAbouts, payload: list);
  }
}
