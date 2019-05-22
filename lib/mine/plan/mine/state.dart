import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_model.dart';

class MinePlanState implements Cloneable<MinePlanState> {
  PlanModel model;

  @override
  MinePlanState clone() {
    return MinePlanState()..model = model;
  }
}

MinePlanState initState(Map<String, dynamic> args) {
  return MinePlanState();
}
