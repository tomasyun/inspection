import 'package:fish_redux/fish_redux.dart';

class InspectionTaskState implements Cloneable<InspectionTaskState> {
  List<String> tasks;
  @override
  InspectionTaskState clone() {
    return InspectionTaskState()..tasks = tasks;
  }
}

InspectionTaskState initState(Map<String, dynamic> args) {
  InspectionTaskState state = InspectionTaskState();
  state.tasks = [];
  return state;
}
