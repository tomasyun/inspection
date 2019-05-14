import 'package:fish_redux/fish_redux.dart';

class MinePlanState implements Cloneable<MinePlanState> {
  @override
  MinePlanState clone() {
    return MinePlanState();
  }
}

MinePlanState initState(Map<String, dynamic> args) {
  return MinePlanState();
}
