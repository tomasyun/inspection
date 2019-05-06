import 'package:fish_redux/fish_redux.dart';

class InspectionTaskState implements Cloneable<InspectionTaskState> {
  @override
  InspectionTaskState clone() {
    return InspectionTaskState();
  }
}

InspectionTaskState initState(Map<String, dynamic> args) {
  return InspectionTaskState();
}
