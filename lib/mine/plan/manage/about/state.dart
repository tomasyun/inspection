import 'package:fish_redux/fish_redux.dart';
import 'package:inspection/entity/plan_about_model.dart';

class PlanAboutState implements Cloneable<PlanAboutState> {
  PlanAboutModel model;
  String id;
  @override
  PlanAboutState clone() {
    return PlanAboutState()
      ..model = model
      ..id = id;
  }
}

PlanAboutState initState(Map<String, dynamic> args) {
  PlanAboutState state = PlanAboutState();
  state.id = args['id'];
  return state;
}
