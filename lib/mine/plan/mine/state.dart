import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_model.dart';

class MinePlanState implements Cloneable<MinePlanState> {
  List<PlanModel> list = [];
  @override
  MinePlanState clone() {
    return MinePlanState()..list = list;
  }
}

MinePlanState initState(Map<String, dynamic> args) {
  return MinePlanState();
}
