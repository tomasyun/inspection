import 'package:fish_redux/fish_redux.dart';

class PlanState implements Cloneable<PlanState> {
  @override
  PlanState clone() {
    return PlanState();
  }
}

PlanState initState(Map<String, dynamic> args) {
  return PlanState();
}
