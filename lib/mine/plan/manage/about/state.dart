import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_about_model.dart';

class PlanAboutState implements Cloneable<PlanAboutState> {
  List<PlanAboutModel> list = [];
  @override
  PlanAboutState clone() {
    return PlanAboutState()..list = list;
  }
}

PlanAboutState initState(Map<String, dynamic> args) {
  return PlanAboutState();
}
