import 'package:fish_redux/fish_redux.dart';

class InspectPlanState implements Cloneable<InspectPlanState> {
  @override
  InspectPlanState clone() {
    return InspectPlanState();
  }
}

InspectPlanState initState(Map<String, dynamic> args) {
  return InspectPlanState();
}
