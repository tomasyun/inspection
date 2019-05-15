import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_model.dart';

class InspectPlanState implements Cloneable<InspectPlanState> {
  List<PlanModel> list = [];
  @override
  InspectPlanState clone() {
    return InspectPlanState()..list = list;
  }
}

InspectPlanState initState(Map<String, dynamic> args) {
  return InspectPlanState();
}
